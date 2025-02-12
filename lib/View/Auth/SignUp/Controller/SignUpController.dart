// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:fixit/Constant/Lists.dart';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/Auth/Login/Controller/LoginController.dart';
import 'package:fixit/View/Auth/Login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignUpController with ChangeNotifier {
  GlobalKey<FormState> formstate59 = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  String role = 'homeowner';
  int? category_id;
  String selectedService = "Cleaning";
  String city = 'Syria';
  String country = 'Damascus';
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();

  bool showContractorDropdown = false;
  bool isshowpassword = true;
  bool isConfirmshowpassword = true;
  NetworkClient client = NetworkClient(http.Client());
  Future<void> SignUp(BuildContext context) async {
    EasyLoading.show();

    try {
      final response = await client.request(
        path: AppApi.Signup,
        requestType: RequestType.POST,
        body: role == 'homeowner'
            ? jsonEncode({
                'username': username.text,
                'email': email.text,
                'phone': phone.text,
                'role': role,
                'country': country,
                'city': city,
                'address': address.text,
                'password': password.text,
                'password_confirmation': password_confirmation.text,
              })
            : jsonEncode({
                'username': username.text,
                'email': email.text,
                'phone': phone.text,
                'role': role,
                'category_id': category_id!,
                'country': country,
                'city': city,
                'address': address.text,
                'password': password.text,
                'password_confirmation': password_confirmation.text,
              }),
      );
      if (response.statusCode == 201) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess('');

        CustomRoute.RouteReplacementTo(
            context,
            ChangeNotifierProvider(
              create: (context) => LoginController(),
              builder: (context, child) => LoginPage(),
            ));
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError('Failed to sign in: ${response.body}');

        throw Exception("Failed to sign in: ${response.body}");
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Error occurred during sign in: $e");

      throw Exception("Error occurred during sign in: $e");
    }
  }

  ShowPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    notifyListeners();
  }

  ShowConfirmPassword() {
    isConfirmshowpassword = isConfirmshowpassword == true ? false : true;
    notifyListeners();
  }

  Cancel(BuildContext context) {
    CustomRoute.RouteReplacementTo(
        context,
        ChangeNotifierProvider(
          create: (context) => LoginController(),
          builder: (context, child) => LoginPage(),
        ));
  }
  // Register() async {
  //   var formdata = formstate59.currentState;
  //   if (formdata!.validate()) {
  //     try {
  //       User user = User();

  //       print("User data: ${user.toJson()}");

  //       SignupService signupService = SignupService();
  //       await signupService.registerUser(user);
  //       Get.offNamed(AppRoute.SignIn);
  //     } catch (e) {
  //       print("Error occurred during registration: $e");
  //       Get.snackbar("Error", "Registration failed. Please try again.");
  //     }
  //   }
  //   notifyListeners();
  // }

  void setUsertype(String value) {
    role = value;
    if (role == 'contractor') {
      showContractorDropdown = true;
    } else {
      showContractorDropdown = false;
    }
    notifyListeners();
  }

  void setService(String serviceName) {
    final service = services.firstWhere((item) => item['name'] == serviceName);
    category_id = service['id'];
    selectedService = serviceName;
    notifyListeners();
    print("Selected Service ID: $category_id");
  }

  void setCountry(String value) {
    country = value;
    notifyListeners();
  }

  void setCity(String value) {
    city = value;
    notifyListeners();
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
