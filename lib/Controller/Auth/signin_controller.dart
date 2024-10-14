import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/constant/route.dart';

abstract class SigninController extends GetxController{
  Signin();
  ToPageForgetPassword();
  ToPageSignup();
}
class SigninControllerImp extends SigninController{
 GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;
  Showpassword(){
    isshowpassword = isshowpassword == true ? false : true ;
    update();
  }
  @override
  Signin() {
    var formdata = formstate.currentState;
    if(formdata!.validate()){
      print("valid");
    }else{
      print("not valid");
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