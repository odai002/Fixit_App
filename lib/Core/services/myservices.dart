import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservices extends GetxService{
  late SharedPreferences sharedPreferences;

  Future<Myservices> initial() async{
     sharedPreferences = await SharedPreferences.getInstance();
     // (name: 'fixit',options: const FirebaseOptions(apiKey: 'AIzaSyDcWt7lBGts1MWkMCJYyMFiftYb97hf3Hs', appId: '1:627506260709:android:295922b3b5e9877b2fc20c', messagingSenderId: '627506260709', projectId: 'fixit-e2a3d')
     return this;
  }
}
initialservices()async{
 await Get.putAsync(() => Myservices().initial());
}