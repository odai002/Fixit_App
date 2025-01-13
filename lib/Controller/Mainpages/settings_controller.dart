import 'package:fixit/Core/services/myservices.dart';
import 'package:get/get.dart';

import '../../Core/constant/route.dart';

class SettingsController extends GetxController{
  Myservices myservices=Get.find();
  logout(){
    myservices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.SignIn);
  }
  toPageTermService(){
    Get.offNamed(AppRoute.TermsAndServicesPage);
  }
}