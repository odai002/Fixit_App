import 'package:fixit/data/data_source/Remote/MainPages/edit_profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditaccountController extends GetxController{
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
  GlobalKey<FormState> FormState0= GlobalKey<FormState>();


  late TextEditingController username = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late String?  user_type;
  late String city='Syria';
  late String country ='Damascus';
  late TextEditingController streetAddress = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();

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

Edit()async{
  var formdata = FormState0.currentState;
  if (formdata!.validate()) {
    try {
      EditProfileService editProfileService = EditProfileService();
      await editProfileService.editProfile(
          username.text, phone.text, password.text,city,
          country, /*confirmPassword.text,*/ streetAddress.text);
    }catch(e){
      print("Error during edit profile: $e");
      }
    }

}
  Cancel() {
    Get.back();
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