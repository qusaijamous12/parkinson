import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toastification/toastification.dart';

import '../../modules/auth/login/login.dart';
import '../../modules/main_tab_bar.dart';
import '../../routes/route_manager.dart';
import '../../shared/utils/utils.dart';
import '../enum/data_status.dart';
import '../model/user_model.dart';

class UserController extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseInstance = FirebaseFirestore.instance;
  final _googleSignIn = GoogleSignIn();

  final _userModel = Rxn<UserModel>();

  ///Data Status
  final loginStatus = Rx<ApiStatus>(ApiStatus.initial);
  final registerStatus = Rx<ApiStatus>(ApiStatus.initial);
  final forgetPasswordStatus = Rx<ApiStatus>(ApiStatus.initial);

  Future<void> login({required String email, required String password}) async {
    loginStatus(ApiStatus.loading);
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        await getUserData(uid: result.user!.uid);

        if (_userModel.value != null) {
          Utils.showToast(title: 'Login Success', type: ToastificationType.success);

          loginStatus(ApiStatus.success);
          RouteManager.offAll(const MainTabBar());
        }
      } else {
        loginStatus(ApiStatus.failure);
        Utils.showToast(title: 'There is an error', type: ToastificationType.error);

      }
    } catch (e) {
      print('there is an error in login $e');
      Utils.showToast(title: 'There is an error ${e.toString()}', type: ToastificationType.error);

      loginStatus(ApiStatus.failure);
    }
  }

  Future<void> getUserData({required String uid}) async {
    try {
      final result = await _firebaseInstance.collection('users').doc(uid).get();
      if (result.data() != null) {
        _userModel(UserModel.fromJson(result.data()!));
      } else {
        _userModel(null);

        Utils.showToast(title: 'There is an error', type: ToastificationType.error);

      }
    } catch (e) {
      print('there is an error in get user Data $e');
    }
  }

  Future<void> createAccount({
    required String email,
    required String name,
    required String password,
    required String phoneNumber,
    required String gender,
  }) async {
    registerStatus(ApiStatus.loading);
    try {
      final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (auth.user != null) {
        await saveDataToFireStore(
          email: email,
          name: name,
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcg4Y51XjQ-zSf87X4nUPTQzsF83eFdZswTg&s',
          phone: phoneNumber,
          uid: auth.user!.uid,
          gender: gender,
        );
        RouteManager.offAll(const LoginScreen());
        Utils.showToast(title: 'Create Account Successfully', type: ToastificationType.success);
        registerStatus(ApiStatus.success);
      } else {
        Utils.showToast(title: 'There is an error', type: ToastificationType.error);
        registerStatus(ApiStatus.failure);
      }
    } catch (e) {
      print('there is an error $e');
      Utils.showToast(title: 'There is an error ${e.toString()}', type: ToastificationType.error);
      registerStatus(ApiStatus.failure);


    }
  }

  Future<void> forgetPassword({required String email}) async {
    forgetPasswordStatus(ApiStatus.loading);
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {
          forgetPasswordStatus(ApiStatus.success);
          Utils.showToast(title: 'Check your email for reset password instructions', type: ToastificationType.success);
    })
        .catchError((error) {
      Utils.showToast(title: 'There is an erro ${error.toString()}', type: ToastificationType.error);
      forgetPasswordStatus(ApiStatus.failure);

    });
  }

  Future<void> saveDataToFireStore({
    required String email,
    required String name,
    required String phone,
    required String uid,
    required String gender,
    required final String imageUrl
  }) async {
    try {
      await _firebaseInstance.collection('users').doc(uid).set({
        'email': email,
        'user_name': name,
        'mobile_number': phone,
        'image_url':imageUrl,
        'uid': uid,
        'profile_image': gender == 'male'
            ? 'https://media.istockphoto.com/id/1351651339/video/smiling-man-with-arms-crossed-over-green-background.jpg?s=640x640&k=20&c=818Lwpd4-JxtTOeZWSSZlDray0oLp8IcM8h3ycM3A3Y='
            : 'https://t3.ftcdn.net/jpg/06/11/52/10/360_F_611521071_MnzKNI2jAH4azth12xhrQtoqavPGYvQ9.jpg',
      });
    } catch (e) {
      print('There is an error in saveDataToFireStore method  ${e.toString()}');
    }
  }


  ///Login With Google
  Future<bool> signInWithGoogle() async {
    loginStatus(ApiStatus.loading);
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        loginStatus(ApiStatus.failure);
        Utils.showToast(title: 'User cancelled the Google sign-in.',type: ToastificationType.error);
        return false;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;
      if (user == null) {
        loginStatus(ApiStatus.failure);
        Utils.showToast(title: 'User sign-in failed.',type: ToastificationType.error);
        return false;
      }

      await saveDataToFireStore(
        email: user.email ?? '',
        uid: user.uid,
        imageUrl: user.photoURL ?? '',
        name: user.displayName??'',
        phone: user.phoneNumber??'',
        gender: 'Male',
      );

      final userDoc = await _firebaseInstance.collection('users').doc(user.uid).get();
      if (!userDoc.exists || userDoc.data() == null) {
        loginStatus(ApiStatus.failure);
        Utils.showToast(title: 'User data not found.',type: ToastificationType.error);
        return false;
      }

      final data = userDoc.data()!;
      final currentUser = UserModel.fromJson(data);
      _userModel(currentUser);

      loginStatus(ApiStatus.success);
      RouteManager.offAll(const MainTabBar());
      return true;
    } catch (error) {
      print('Google Sign-In Error: $error');
      loginStatus(ApiStatus.failure);
      Utils.showToast(title: 'Google Sign-In Error: $error',type: ToastificationType.error);
      return false;
    }
  }

  UserModel? get userModel => _userModel.value;
}
