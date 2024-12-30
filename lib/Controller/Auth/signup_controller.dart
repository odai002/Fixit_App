import 'package:fixit/data/Model/user.dart';
import 'package:fixit/data/data_source/Remote/auth/signup_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/constant/route.dart';


abstract class SignupController extends GetxController{
  Register();
  Cancel();
}
class SignupControllerImp extends SignupController{

  List<String> users=['homeowner', 'contractor'];
  List<Map<String, dynamic>> services = [
    {'id': 1, 'name': 'Cleaning'},
    {'id': 2, 'name': 'Handyman'},
    {'id': 3, 'name': 'Movers'},
    {'id': 4, 'name': 'Landscaping'},
    {'id': 5, 'name': 'HVAC'},
    {'id': 6, 'name': 'Plumbing'},
    {'id': 7, 'name': 'Snow Removal'},
    {'id': 8, 'name': 'Electrician'},
    {'id': 9, 'name': 'Roof Repair'},
    {'id': 10, 'name': 'Air Conditioning'},
    {'id': 11, 'name': 'Flooring'},
    {'id': 12, 'name': 'Carpenter'},
  ];

  List<String> Countries = [
    "30".tr,
    "31".tr,
    "32".tr,
    "33".tr,
    "34".tr,
    "35".tr
  ];

  List<String> Cities = [
    "36".tr,
    "37".tr,
    "38".tr,
    "39".tr,
    "40".tr,
    "41".tr,
    "42".tr,
    "43".tr,
    "44".tr,
    "45".tr,
    "46".tr,
    "47".tr,
    "48".tr,
    "49".tr,
    "50".tr,
    "51".tr,
    "52".tr,
    "53".tr,
    "54".tr,
    "55".tr,
    "56".tr,
    "57".tr,
    "58".tr,
    "59".tr,
    "60".tr,
    "61".tr,
    "62".tr,
    "63".tr,
    "64".tr,
    "65".tr,
    "66".tr,
    "67".tr,
    "68".tr,
    "69".tr,
    "70".tr,
    "71".tr,
    "72".tr,
    "73".tr,
    "74".tr,
    "75".tr,
    "76".tr,
    "77".tr,
    "78".tr,
    "79".tr,
    "80".tr,
    "81".tr,
    "82".tr,
    "83".tr,
    "84".tr,
    "85".tr,
    "86".tr,
    "87".tr,
    "88".tr,
    "89".tr,
    "90".tr,
    "91".tr,
    "92".tr,
    "93".tr,
    "94".tr,
    "95".tr,
    "96".tr,
    "97".tr,
    "98".tr,
    "99".tr,
    "100".tr
  ];


  GlobalKey<FormState> formstate9 = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late String role='homeowner';
   int? category_id ;
  String selectedService="Cleaning";
  late String city='Syria';
  late String country ='Damascus';
  late TextEditingController address;
  late TextEditingController password;
  late TextEditingController password_confirmation;


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
  Register() async {
      var formdata = formstate9.currentState;
      if (formdata!.validate()) {
       try{
         User user = User(
           username: username.text,
           email: email.text,
           phone: phone.text,
           category_id: role == "homeowner" ? null : category_id,
           role: role,
           country: country,
           city: city,
           address: address.text,
           password: password.text,
           password_confirmation: password_confirmation.text,
         );

         print("User data: ${user.toJson()}"); // طباعة بيانات المستخدم

         SignupService signupService = SignupService();
         await signupService.registerUser(user);
         Get.offNamed(AppRoute.SignIn);
       }catch(e){
         print("Error occurred during registration: $e");
         Get.snackbar("Error", "Registration failed. Please try again.");
       }
       }
      update();
    }



    void setUsertype(String value){
  role = value;
  if(role == 'contractor'){
    showContractorDropdown=true;
  }else{
    showContractorDropdown=false;
  }
  update();
}
  void setService(String serviceName) {
    final service = services.firstWhere((item) => item['name'] == serviceName);
    category_id = service['id'];
    selectedService = serviceName;
    update();
    print("Selected Service ID: $category_id");
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
    address = TextEditingController();
    password = TextEditingController();
    password_confirmation = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    password_confirmation.dispose();
    phone.dispose();
    address.dispose();
    username.dispose();

    super.dispose();
  }
}