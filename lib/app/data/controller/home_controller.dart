import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../shared/utils/utils.dart';
import '../enum/data_status.dart';
import '../model/chat_model.dart';
import '../model/user_model.dart';
import 'user_controller.dart';

class HomeController extends GetxController{


  @override
  void onInit() {
    Future.delayed(Duration.zero,()async{
      await getDoctors();
    });
    super.onInit();
  }


  final _firebaseFireStore=FirebaseFirestore.instance;


  final _doctors=RxList<UserModel>([]);
  final _listChatModel = RxList<ChatModel>([]);
  final userModel=Get.find<UserController>(tag: 'user_controller').userModel;


  final getDoctorsStatus=Rx<ApiStatus>(ApiStatus.initial);

  Future<void> getDoctors({bool isDoctors=true})async{
    try{
      _doctors.clear();
      getDoctorsStatus(ApiStatus.loading);
      final result=await _firebaseFireStore.collection('users').get();

      if(result.docs.isNotEmpty){
        result.docs.forEach((e){
          Utils.printLog('EEEE${e['user_type']}');
          if(isDoctors){
            if(e['user_type']=='doctor'){
              _doctors.add(UserModel.fromJson(e.data()));
            }
          } else{
            if(e['user_type']=='user'){
              Utils.printLog('YES!');
              _doctors.add(UserModel.fromJson(e.data()));
            }
          }





        });
      }
      Utils.printLog('SSS${_doctors.length}');

      getDoctorsStatus(ApiStatus.success);

      Get.find<UserController>(tag: 'user_controller').getUserAppointments();
    }catch(error){
      Utils.printLog('Error When Get Doctors ${error.toString()}');
      getDoctorsStatus(ApiStatus.failure);
    }
  }

  void sendMessage(
      {required String receiverId,
        required String dateTime,
        required String text,
        String? image,
        required String profileImage}) {
    final  chatModel = ChatModel(
        text: text,
        dateTime: dateTime,
        senderId: userModel?.uid,
        reciverId: receiverId,
        profileImage: profileImage);
    _firebaseFireStore
        .collection('users')
        .doc(userModel?.uid)
        .collection('chats')
        .doc(receiverId)
        .collection('message')
        .add(chatModel.toMap())
        .then((value) {})
        .catchError((error) {
      print('there is an error when send message !');
    });

    _firebaseFireStore
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel?.uid)
        .collection('message')
        .add(chatModel.toMap())
        .then((value) {
      print('message Send Success !');
    }).catchError((error) {
      print('there is an error when send message !');
    });
    _listChatModel.add(chatModel);
  }


  Future getMessages({required String receiverId}) async {
    print('getMessages');
    await _firebaseFireStore
        .collection('users')
        .doc(userModel?.uid)
        .collection('chats')
        .doc(receiverId)
        .collection('message')
        .orderBy('dateTime', descending: false)
        .snapshots()
        .listen((event) {
      _listChatModel.clear();
      event.docs.forEach((element) {
        _listChatModel.add(ChatModel.fromJson(element.data()));
      });
      print('Get Messages Success State');
    });
  }



  List<UserModel> get doctors => _doctors;
  List<UserModel> get physicalTherapists => _doctors
      .where((doctor) =>
          doctor.doctorType?.toLowerCase() == 'physical therapy')
      .toList();
  List<ChatModel> get listChatModel=>_listChatModel;

}
