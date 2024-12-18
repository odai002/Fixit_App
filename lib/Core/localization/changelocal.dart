import 'dart:ui';
import 'package:fixit/Core/services/myservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? Language;
  Myservices myServices = Get.find();

  @override
  void onInit() {
    super.onInit();

    String? savedLang = myServices.sharedPreferences.getString("lang");
    if (savedLang != null) {
      Language = Locale(savedLang); // إذا كانت اللغة مخزنة، استخدمها
    } else {
      Language = Locale("en");
    }
  }

  void ChangeLanguage(String langcode) {
    Locale locale = Locale(langcode);

    myServices.sharedPreferences.setString("lang", langcode);
    myServices.sharedPreferences.setBool("isLanguageSelected", true);

    Language = locale;
    Get.updateLocale(locale);
  }
}
