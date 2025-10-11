import 'package:get/get.dart';

import '../../modules/home_screen/home_screen.dart';
import '../../modules/list_chat_screen/list_chat_screen.dart';
import '../../modules/profile_screen/profile_screen.dart';

class AppController extends GetxController{
  final screens=const [
    HomeScreen(),
    ListChatScreen(),
    ProfileScreen()
  ];
  final currentIndex=RxInt(0);



}