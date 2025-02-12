// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:fixit/View/HomeOwner/EditProfile/Service/EditProfileService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditaccountController extends GetxController {
  NetworkClient client = NetworkClient(http.Client());

  GlobalKey<FormState> FormState0 = GlobalKey<FormState>();

  late TextEditingController username = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late String? user_type;
  String? city;
  String? country;
  late TextEditingController streetAddress = TextEditingController();
  late TextEditingController old_password = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController password_confirmation = TextEditingController();

  bool showContractorDropdown = false;
  bool isshowpassword = true;
  bool isConfirmshowpassword = true;

  ShowPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  ShowConfirmPassword() {
    isConfirmshowpassword = isConfirmshowpassword == true ? false : true;
    update();
  }

  Edit() async {
    var formdata = FormState0.currentState;
    if (formdata!.validate()) {
      try {
        EditProfileService editProfileService = EditProfileService();
        var res = await editProfileService.editProfile(
          username.text,
          phone.text,
          city!,
          country!,
          streetAddress.text,
        );
        if (password.text.isNotEmpty &&
            password_confirmation.text.isNotEmpty &&
            old_password.text.isNotEmpty) {
          if (password.text != password_confirmation.text) {
            Get.snackbar("Error", "Passwords do not match");
            return;
          }
          await editProfileService.updatePassword(
              old_password.text, password.text, password_confirmation.text);
        }
        if (res) {
          Get.snackbar("Success", "Profile updated successfully",
              backgroundColor: Colors.green, colorText: Colors.white);
        } else {
          Get.snackbar("Error", "Failed to update profile",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      } catch (e) {
        print("Error during edit profile: $e");
        Get.snackbar("Error", "Failed to update profile",
            backgroundColor: Colors.red);
      }
    }
  }

  Future<void> GetProfile() async {
    try {
      final response = await client.request(
        path: AppApi.GetProfile,
        requestType: RequestType.GET,
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final data = responseData['data'];
        username.text = data['username'] ?? '';
        email.text = data['email'] ?? '';
        phone.text = data['phone'] ?? '';
        country = data['country'] ?? '';
        city = data['city'] ?? '';
        streetAddress.text = data['address'] ?? '';
        log(country!);
        update();
      } else {
        print(
            'Failed to load profile data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching profile data: $e");
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
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    streetAddress = TextEditingController();
    password = TextEditingController();
    password_confirmation = TextEditingController();
    GetProfile();
    super.onInit();
  }
}
