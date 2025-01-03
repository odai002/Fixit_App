import 'dart:convert';
import 'dart:developer';

import 'package:fixit/Core/constant/link_api.dart';
import 'package:fixit/data/data_source/Remote/auth/signin_service.dart';
import 'package:http/http.dart' as http;

class EditProfileService {
  Future<void> editProfile(
      String username,
      String phone,
      String password,
      String city,
      String country,
      String address,
      ) async {
    String url = AppLink.EditProfile;
    SigninService signInService = SigninService();
    String? token = await signInService.getToken();
    log("Token: $token");

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
          "password": password,
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
        log("Profile updated successfully: $responseBody");
      } else {
        log("Error: ${response.statusCode}, Body: ${response.body}");
        throw Exception("Failed to editProfile: ${response.body}");
      }
    } catch (e) {
      log("Exception: $e");
    }
  }
}
