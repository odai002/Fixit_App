import 'dart:convert';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Core/constant/link_api.dart';

class SigninService {
  bool isAuthenticated = false;
  String? token;
  Future<String?> signIn(String email, String password) async {
    await Firebase.initializeApp(name:  'fixit',options: FirebaseOptions(apiKey: 'AIzaSyDcWt7lBGts1MWkMCJYyMFiftYb97hf3Hs', appId: '1:627506260709:android:295922b3b5e9877b2fc20c', messagingSenderId: '627506260709', projectId: 'fixit-e2a3d'));
log(FirebaseMessaging.instance.app.name);
    String? device_token= await FirebaseMessaging.instance.getToken();
    log(device_token!);
    String url = AppLink.signin;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'email': email,
          'password': password,
          'device_token': device_token,

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

  Future<String?> getToken()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  Future<String?> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }
  }

