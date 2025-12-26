import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../shared/utils/utils.dart';
import '../enum/data_status.dart';
import '../model/user_model.dart';

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


  final getDoctorsStatus=Rx<ApiStatus>(ApiStatus.initial);

  Future<void> getDoctors()async{
    try{
      getDoctorsStatus(ApiStatus.loading);
      final result=await _firebaseFireStore.collection('users').get();

      if(result.docs.isNotEmpty){
        result.docs.forEach((e){
          if(e['user_type']=='doctor'){
            _doctors.add(UserModel.fromJson(e.data()));
          }
        });
      }

      getDoctorsStatus(ApiStatus.success);
    }catch(error){
      Utils.printLog('Error When Get Doctors ${error.toString()}');
      getDoctorsStatus(ApiStatus.failure);
    }
  }



  List<UserModel> get doctors=>_doctors;

}