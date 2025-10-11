import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../shared/utils/utils.dart';
import '../enum/data_status.dart';
import '../model/user_model.dart';

class UserController extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseInstance = FirebaseFirestore.instance;

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
          Utils.successToast();
          // Get.offAll(() =>const MyTabBar());
          loginStatus(ApiStatus.success);
        }
      } else {
        loginStatus(ApiStatus.failure);
        Utils.errorToast();
      }
    } catch (e) {
      print('there is an error in login $e');
      Utils.errorToast();
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

        Utils.errorToast();
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
          phone: phoneNumber,
          uid: auth.user!.uid,
          gender: gender,
        );

        registerStatus(ApiStatus.success);
      } else {
        Utils.errorToast();
      }
    } catch (e) {
      print('there is an error $e');
      Utils.errorToast();
    }
  }

  Future<void> forgetPassword({required String email}) async {
    forgetPasswordStatus(ApiStatus.loading);
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {})
        .catchError((error) {
          Utils.errorToast();
        });
  }

  Future<void> saveDataToFireStore({
    required String email,
    required String name,
    required String phone,
    required String uid,
    required String gender,
  })
  async {
    try {
      await _firebaseInstance.collection('users').doc(uid).set({
        'email': email,
        'user_name': name,
        'mobile_number': phone,
        'uid': uid,
        'profile_image': gender == 'male'
            ? 'https://media.istockphoto.com/id/1351651339/video/smiling-man-with-arms-crossed-over-green-background.jpg?s=640x640&k=20&c=818Lwpd4-JxtTOeZWSSZlDray0oLp8IcM8h3ycM3A3Y='
            : 'https://t3.ftcdn.net/jpg/06/11/52/10/360_F_611521071_MnzKNI2jAH4azth12xhrQtoqavPGYvQ9.jpg',
      });
    } catch (e) {
      print('There is an error in saveDataToFireStore method ');
    }
  }

  UserModel? get userModel => _userModel.value;
}
