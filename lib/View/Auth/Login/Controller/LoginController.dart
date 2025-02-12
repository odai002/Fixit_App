// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Controller/ServicesProvider.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/Contractor/NavigationPageTemplate/Controller/NavigationPageTemplateHomeOwnerController.dart';
import 'package:fixit/View/Contractor/NavigationPageTemplate/NavigationPageTemplateContractor.dart';
import 'package:fixit/View/HomeOwner/NavigationPageTemplate/Controller/NavigationPageTemplateHomeOwnerController.dart';
import 'package:fixit/View/HomeOwner/NavigationPageTemplate/NavigationPageTemplateHomeOwner.dart';
import 'package:fixit/View/Auth/SignUp/Controller/SignUpController.dart';
import 'package:fixit/View/Auth/SignUp/SignUpPage.dart';
import 'package:fixit/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginController with ChangeNotifier {
  GlobalKey<FormState> formstate8 = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isshowpassword = true;
  Showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    notifyListeners();
  }

  NetworkClient client = NetworkClient(http.Client());

  Future<void> Login(BuildContext context) async {
    // String? device_token = await FirebaseMessaging.instance.getToken();
    // log(device_token!);
    EasyLoading.show();

    try {
      final response = await client.request(
        path: AppApi.Login,
        requestType: RequestType.POST,
        body: jsonEncode({
          'email': email.text,
          'password': password.text,
          'device_token': await ServicesProvider.getDeviceToken(),
        }),
      );
      if (response.statusCode == 200) {
        EasyLoading.dismiss();

        final responsedata = jsonDecode(response.body);
        ServicesProvider.saveUser(User.fromJson(responsedata['data']));
        if (await ServicesProvider.getUserType() == 'homeowner') {
          ToHomeOwner(context);
        } else if (await ServicesProvider.getUserType() == 'contractor') {
          ToContractor(context);
        }
      } else {
        EasyLoading.dismiss();

        throw Exception("Failed to sign in: ${response.body}");
      }
    } catch (e) {
      EasyLoading.dismiss();

      throw Exception("Error occurred during sign in: $e");
    }
  }

  ToPageForgetPassword() {
    //  Get.offNamed(AppRoute.ForgetPassword);
  }

  ToContractor(BuildContext context) {
    CustomRoute.RouteAndRemoveUntilTo(
        context,
        ChangeNotifierProvider(
          create: (context) => NavigationPageTemplateContractorController(),
          builder: (context, child) => NavigationPageTemplateContractor(),
        ));
  }

  ToHomeOwner(BuildContext context) {
    CustomRoute.RouteAndRemoveUntilTo(
        context,
        ChangeNotifierProvider(
          create: (context) => NavigationPageTemplateHomeOwnerController(),
          builder: (context, child) => NavigationPageTemplateHomeOwner(),
        ));
  }

  ToPageSignup(BuildContext context) {
    CustomRoute.RouteReplacementTo(
        context,
        ChangeNotifierProvider(
          create: (context) => SignUpController(),
          builder: (context, child) => SignUpPage(),
        ));
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
