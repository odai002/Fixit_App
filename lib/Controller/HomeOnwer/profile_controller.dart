import 'dart:convert';
import 'dart:developer';
import 'package:fixit/Core/constant/link_api.dart';
import 'package:fixit/data/data_source/Remote/auth/signin_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString country = ''.obs;
  RxString city = ''.obs;
  RxString streetAddress = ''.obs;


  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }


  Future<void> fetchProfileData() async {
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();
    try {
      final response = await http.get(
        Uri.parse(AppLink.getProfile),
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        final data = responseData['data'];

        username.value = data['username'] ?? '';
        email.value = data['email'] ?? '';
        phone.value = data['phone'] ?? '';
        country.value = data['country'] ?? '';
        city.value = data['city'] ?? '';
        streetAddress.value = data['address'] ?? ''; // تمثل "address" في الرد
      } else {
        print('Failed to load profile data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching profile data: $e");
    }
  }
}
