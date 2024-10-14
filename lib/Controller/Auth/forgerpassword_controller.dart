import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/constant/route.dart';

abstract class ForgerpasswordController extends GetxController{
  CheckEmail();
  ToPageVeryfiyCode();
}
class ForgetpasswordControllerImp extends ForgerpasswordController{
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late TextEditingController email;
  @override
  CheckEmail() {
  }

  @override
  ToPageVeryfiyCode() {
    var formdata = formstate.currentState;
    if(formdata!.validate()){
      Get.offNamed(AppRoute.VeryfiyCode);
    }else{
      print("not valid");
    }
  }

  @override
  void onInit() {
    email= TextEditingController();
     super.onInit();
  }


}