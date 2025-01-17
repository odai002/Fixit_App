import 'dart:convert';
import 'dart:developer';

import 'package:fixit/Core/constant/link_api.dart';
import 'package:fixit/data/data_source/Remote/auth/signin_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditProfileService {
  Future<void> editProfile(
      String username,
      String phone,
      String city,
      String country,
      String address,
      ) async {
    String url = AppLink.EditProfile;
    SigninService signInService = SigninService();
    String? token = await signInService.getToken();

    if (token == null || token.isEmpty) {
      log("Error: Token is null or empty. Please login again.");
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "username": username,
          "phone": phone,
          "city": city,
          "country": country,
          "address": address,
        }),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
/*
        log("Profile updated successfully: $responseBody");
*/
      } else {
        log("Error: ${response.statusCode}, Body: ${response.body}");
        throw Exception("Failed to editProfile: ${response.body}");
      }
    } catch (e) {
      log("Exception: $e");
    }
  }
  Future<void> updatePassword(String old_password, String password, String password_confirmation) async {
    SigninService signInService = SigninService();
    String? token = await signInService.getToken();
    String url = AppLink.updatePassword;
    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "old_password": old_password,
          "password": password,
          "password_confirmation": password_confirmation,
        }),
      );

      log("Response: ${res.body}");
      if (res.statusCode == 200) {
        final responseBody = jsonDecode(res.body);
        Get.snackbar("Success", "Password updated successfully", backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        log("Failed to update password: ${res.body}");
        Get.snackbar("Error", "Failed to update password: ${res.body}", backgroundColor: Colors.red);
      }
    } catch (e) {
      log("Exception in updatePassword: $e");
      Get.snackbar("Error", "Failed to update password due to an error", backgroundColor: Colors.red);
    }
  }
}
