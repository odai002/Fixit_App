import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/constant/route.dart';
import '../../data/data_source/Remote/auth/signin_service.dart';

abstract class SigninController extends GetxController{
  Signin();
  ToPageForgetPassword();
  ToPageSignup();
}


class SigninControllerImp extends SigninController{

 GlobalKey<FormState> formstate8= GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;


  bool isshowpassword = true;
  Showpassword(){
    isshowpassword = isshowpassword == true ? false : true ;
    update();
  }

  @override
  Signin() async {
    var formdata = formstate8.currentState;
    if (formdata!.validate()) {
      try {
        SigninService signinService=SigninService();
        String? token = await signinService.signIn(email.text, password.text);

        if (token != null) {
          String? role = await signinService.getUserType();
          if (role == "admin") {
            Get.offNamed(AppRoute.HomePage);
          }else {
            Get.offNamed(AppRoute.SignIn);
          }
        } else {
          print("Failed to get token");
        }
      } catch (e) {
        print("Error during sign in: $e");
      }
    }
  }

 @override
 ToPageForgetPassword() {
   Get.offNamed(AppRoute.ForgetPassword);
 }

 @override
 ToPageSignup() {
   Get.toNamed(AppRoute.SignUp);
 }
@override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
     super.dispose();
  }
}