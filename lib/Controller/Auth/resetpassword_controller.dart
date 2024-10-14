import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/constant/route.dart';

abstract class ResetpasswordController extends GetxController{
  save();
  ToPageSucsessResset();
}
class ResetpasswordControllerImp extends ResetpasswordController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController Confirmpassword;


  bool isshowpassword = true;
  bool isConfirmshowpassword = true;
  ShowPassword(){
    isshowpassword = isshowpassword == true ? false : true ;
    update();
  }
  ShowConfirmPassword(){
    isConfirmshowpassword = isConfirmshowpassword == true ? false : true ;
    update();
  }


  @override
  ToPageSucsessResset() {
    var formdata = formstate.currentState;
    if(formdata!.validate()){
      Get.offNamed(AppRoute.SucsessResetPassword);
    }else{
      print("Not Valid");
    }
  }

  @override
  save() {
  }


  @override
  void onInit() {
    password =TextEditingController();
    Confirmpassword =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    Confirmpassword.dispose();
    super.dispose();
  }
}