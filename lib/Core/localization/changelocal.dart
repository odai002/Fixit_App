import 'dart:ui';

import 'package:fixit/Core/services/myservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LocaleController extends GetxController{
  Locale? Language;
  Myservices myServices= Get.find();


  ChangeLanguage(String langcode){
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }
  @override
  void onInit() {
    String? SharedPredLang= myServices.sharedPreferences.getString("Lang");
    if(SharedPredLang == "ar"){
      Language= Locale("ar");
    }else if(SharedPredLang == "en"){
      Language = Locale("en");
    }else{
      Language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}