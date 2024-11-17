import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Core/constant/link_api.dart';

class SigninService {
  bool isAuthenticated = false;
  String? token;
  Future<String?> signIn(String email, String password) async {
    String url = AppLink.signin;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responsedata= jsonDecode(response.body);
        token=responsedata['data']['token'];
        String role=responsedata['data']['role'];
        isAuthenticated=true;

        SharedPreferences sharedpref= await SharedPreferences.getInstance();
        await sharedpref.setString('token',token!);
        await sharedpref.setString('role', role);
        return token;
      } else {
        throw Exception("Failed to sign in: ${response.body}");
      }
    } catch (e) {
      throw Exception("Error occurred during sign in: $e");
    }
  }
  Future<void> signout()async{
     SharedPreferences sharedpref = await SharedPreferences.getInstance();
     sharedpref.remove('token');
     token=null;
     isAuthenticated=false;
  }

  Future<String?> getToken()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  Future<String?> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }
  }

