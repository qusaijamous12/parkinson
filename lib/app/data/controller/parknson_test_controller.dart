import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../shared/utils/utils.dart';
import '../enum/data_status.dart';
import '../model/video_model.dart';

class ParknsonTestController extends GetxController{


  final _firebaseInstance = FirebaseFirestore.instance;
  final  result=RxnString();
  final isTesting = RxBool(false);

  final _videos=RxList<VideoModel>([]);
  final getParknsonVideosStatus=Rx<ApiStatus>(ApiStatus.initial);
  Future<void> getParknsonVideos()async{
    try{
      getParknsonVideosStatus(ApiStatus.loading);
      
      final result=await _firebaseInstance.collection('videos').get();
      if(result.docs.isNotEmpty){
        _videos
          ..clear()
          ..addAll(
            result.docs.map((e) => VideoModel.fromJson(e.data())).toList(),
          );

      }else{
        getParknsonVideosStatus(ApiStatus.noData);
      }
      getParknsonVideosStatus(ApiStatus.success);
      
    }catch(error){
      Utils.printLog('Error When Get Parknson Videos ${error.toString()}');
      getParknsonVideosStatus(ApiStatus.failure);
    }
  }

  List<VideoModel> get videos=>_videos;

}