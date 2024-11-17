import 'dart:convert';
import 'package:fixit/Core/constant/link_api.dart';
import 'package:http/http.dart'as http;
import '../../../Model/user.dart';

class SignupService {
  final String url = AppLink.signup;

  Future<void> registerUser(User user) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(user.toJson()));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Register successful");
      } else {
        print("Failed to register: Status Code ${response.statusCode}");
        print("Error message: ${response.body}");
      }
    } catch (e) {
      print("Register failed with error: $e");
    }
  }
}
