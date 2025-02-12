// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:fixit/Model/user.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/Auth/Login/Controller/LoginController.dart';
import 'package:fixit/View/Auth/Login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ServicesProvider with ChangeNotifier {
  static SharedPreferences? sharedPreferences;
  static String? device_token;
  static NetworkClient? client;

  ServicesProvider();

  static Future<String> getUserType() async {
    sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences!.getString('role') ?? '';
  }

  static String getToken() {
    Future.delayed(Duration.zero).then((value) async {
      sharedPreferences = await SharedPreferences.getInstance();
    });

    return sharedPreferences!.getString('token') ?? '';
  }

  static String getLocale() {
    Future.delayed(Duration.zero).then((value) async {
      sharedPreferences = await SharedPreferences.getInstance();
    });

    return sharedPreferences!.getString('lang') ?? 'en';
  }

  static String getDeviceToken() {
    Future.delayed(Duration.zero).then((value) async {
      device_token = await FirebaseMessaging.instance.getToken();
    });

    return device_token ?? '';
  }

  static Future<void> saveUser(User user) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString('token', user.token!);
    await sharedPreferences!.setString('role', user.role!);
    await sharedPreferences!.setBool('isLoggin', true);
  }

  static Future<void> logout(BuildContext context) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.remove('token');
    await sharedPreferences!.remove('role');
    sharedPreferences!.remove('isLoggin');
    CustomRoute.RouteAndRemoveUntilTo(
        context,
        ChangeNotifierProvider(
          create: (context) => LoginController(),
          builder: (context, child) => LoginPage(),
        ));
  }

  static Future<bool> isLoggin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!.getBool('isLoggin') ?? false;
  }

  Future<SharedPreferences> sharedprefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!;
  }
}
