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

  List<String> Countries = ['Syria', 'Jordan', 'Lebanon', 'Saudi Arabia', 'UAE', 'Iraq'];
  List<String> Cities = ['Damascus', 'Aleppo', 'Homs', 'Hama', 'Latakia', 'Tartus',
    'Idlib', 'Deir ez-Zor', 'Al-Hasakah', 'Raqqa', 'Daraa',
    'As-Suwayda', 'Quneitra'
  ,'Amman', 'Zarqa', 'Irbid', 'Aqaba', 'Balqa', 'Madaba',
    'Jerash', 'Mafraq', 'Karak', 'Tafilah', 'Ma\'an', 'Ajloun',
      'Beirut', 'Mount Lebanon', 'North Lebanon', 'South Lebanon',
      'Beqaa', 'Nabatieh',
      'Riyadh', 'Makkah', 'Medina', 'Eastern Province', 'Asir',
      'Tabuk', 'Hail', 'Jazan', 'Najran', 'Al Bahah', 'Al Jawf',
      'Northern Borders',
      'Abu Dhabi', 'Dubai', 'Sharjah', 'Ajman', 'Ras Al Khaimah',
      'Fujairah', 'Umm Al Quwain',
      'Baghdad', 'Basra', 'Mosul', 'Erbil', 'Sulaymaniyah',
      'Karbala', 'Najaf', 'Kirkuk', 'Anbar', 'Diyala',
      'Dhi Qar', 'Babil', 'Maysan', 'Wasit', 'Muthanna', 'Qadisiyyah'
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
           category_id: role == "homeowner" ? null : category_id, // تعيين null إذا كان homeowner
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
    final service = services.firstWhere((item) => item['name'] == serviceName);    //بستخدم firstWhere للبحث عن الخدمة في قائمة services التي يكون اسمها (name) مطابقًا لـ serviceName الممرر كمعامل للدالة
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