import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/constant/route.dart';


abstract class SignupController extends GetxController{
  Register();
  Cancel();
}
class SignupControllerImp extends SignupController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  var  user_type;
  var city;
  var country;
  late TextEditingController streetAddress;
  late TextEditingController password;
  late TextEditingController confirmPassword;


  bool showContractorDropdown = false;
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
  Cancel() {
    Get.back();
   }

  @override
  Register() {
  var formdata = formstate.currentState;
  if(formdata!.validate()){
    Get.offNamed(AppRoute.VeryfiyCodeSignUp);
  }else{
    print("not valid");
  }
}

void setUsertype(String value){
  user_type = value;
  if(user_type == 'Contractor'){
    showContractorDropdown=true;
  }else{
    showContractorDropdown=false;
  }
  update();
}

  void setCountry(String value) {
    country = value;
    update();
  }

  void setCity(String value) {
    city = value;
    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    user_type = TextEditingController();
    city= TextEditingController();
    country = TextEditingController();
    streetAddress = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    user_type.dispose();
    confirmPassword.dispose();
    country.dispose();
    city.dispose();
    phone.dispose();
    streetAddress.dispose();
    username.dispose();

    super.dispose();
  }
}