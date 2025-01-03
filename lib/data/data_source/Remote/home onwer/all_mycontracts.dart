import 'dart:convert';
import 'dart:developer';
import 'package:fixit/data/data_source/Remote/auth/signin_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:fixit/Core/constant/link_api.dart';

class getAllMyContracts {
  var contracts = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;


  Future<List<Map<String, dynamic>>> getMyContractors() async {
    final url = Uri.parse(AppLink.myContracts);
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();
    try {
      final response = await http.get(
          url, headers: {"Authorization": "Bearer $token"});
      log("Response Status: ${response.statusCode}");
      log("Response Body: ${response.body}");
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        log("$body");
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


  Future<bool> AcceptContract(int contractId) async {
    final url = Uri.parse(AppLink.AcceptContract(contractId));
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();
    try {
      final response = await http.post(url, headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      }, body: jsonEncode({
        'status': true,
        'id': contractId,
      }),
      );
      if (response.statusCode == 200) {
        log("Contract $contractId accepted.");
        return true;
      } else {
        log("Error accepting contract: ${response.body}");
        return false;
      }
    } catch (e) {
      log("Exception in AcceptContract: $e");
      return false;
    }
  }


  Future<bool> RejectContract(int contractId) async {
    final url = Uri.parse(AppLink.RejactContract(contractId));
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();    try {
      final response = await http.post(url, headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      },
        body: jsonEncode({
          'status': false,
          'id': contractId,
        }),
      );
      if (response.statusCode == 200) {
        log("Contract $contractId rejected.");
        return true;
      } else {
        log("Error rejecting contract: ${response.body}");
        return false;
      }
    } catch (e) {
      log("Exception in RejectContract: $e");
      return false;
    }
  }
}