import 'dart:convert';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileHomeownerController with ChangeNotifier {
  NetworkClient client = NetworkClient(http.Client());
  bool isLoading = false;
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString country = ''.obs;
  RxString city = ''.obs;
  RxString streetAddress = ''.obs;

  Future<void> GetProfile() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await client.request(
        path: AppApi.GetProfile,
        requestType: RequestType.GET,
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final data = responseData['data'];
        username.value = data['username'] ?? '';
        email.value = data['email'] ?? '';
        phone.value = data['phone'] ?? '';
        country.value = data['country'] ?? '';
        city.value = data['city'] ?? '';
        streetAddress.value = data['address'] ?? '';
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        print(
            'Failed to load profile data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print("Error fetching profile data: $e");
    }
  }
}
