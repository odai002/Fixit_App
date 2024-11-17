import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditaccountController extends GetxController{
  List<String> users=['Home Owner', 'Contractor'];
  List<String> services =  ['Cleaning', 'Handyman', 'Movers', 'Landscaping', 'HVAC',
    'Plumbing', 'Snow Removal', 'Electrician', 'Roof Repair', 'Carpet Cleaning', 'Flooring', 'Carpenter'];
  List<String> Country = ['Syria','Jordan','Qatar'];
  List<String> City = ['Damascus', 'Aleppo', 'Homs', 'Amman', 'AL_Douha'];

  late TextEditingController username = TextEditingController(text: "odai");
  late TextEditingController email = TextEditingController(text:"odaisue@gmail.com");
  late TextEditingController phone = TextEditingController(text: "099554167");
  late String?  user_type='Home Owner';
  String? service='Cleaning';
  late String? city='Syria';
  late String? country ='Damascus';
  late TextEditingController streetAddress = TextEditingController(text: "Al-Tal");
  late TextEditingController password = TextEditingController(text: "************");
  late TextEditingController confirmPassword = TextEditingController(text: "************");



  bool showContractorDropdown = false;
  bool isshowpassword = true;
  bool isConfirmshowpassword = true;



  void initializeFields(String initialUsername, String initialEmail, String initialPhone, String initialStreet , String initialpass, String initialconfpass) {
    username.text = initialUsername;
    email.text = initialEmail;
    phone.text = initialPhone;
    streetAddress.text = initialStreet;
    password.text = initialpass;
    confirmPassword.text= initialconfpass;
  }

  ShowPassword(){
    isshowpassword = isshowpassword == true ? false : true ;
    update();
  }
  ShowConfirmPassword(){
    isConfirmshowpassword = isConfirmshowpassword == true ? false : true ;
    update();
  }

Edit(){

}

  Cancel() {
    Get.back();
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

  void setService(String value) {
    service = value;
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
    username =TextEditingController();
    email =TextEditingController();
    phone = TextEditingController();
    streetAddress=TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }
}