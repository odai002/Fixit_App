import 'dart:convert';
import 'dart:developer';
import 'package:fixit/data/data_source/Remote/auth/signin_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:fixit/Core/constant/link_api.dart';

class getAllMyContracts{
  var contracts = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;


  Future<List<Map<String, dynamic>>> getMyContractors() async {
    final url = Uri.parse(AppLink.myContracts);
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();
    try {
      final response = await http.get(url, headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        if (body['data'] != null) {
          return List<Map<String, dynamic>>.from(body['data']);
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
      }