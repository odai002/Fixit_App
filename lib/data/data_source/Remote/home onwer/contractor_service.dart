import 'dart:convert';
import 'package:fixit/data/data_source/Remote/auth/signin_service.dart';
import 'package:http/http.dart' as http;
import '../../../../Core/constant/link_api.dart';

class ContractorService {
  bool isloading=true;
  Future<List<Map<String, dynamic>>> getContractorByCategoryName(int category_id) async {
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();

    if (token == null) {
      throw Exception("No token found");
    }

    const String url = AppLink.getcontractorsbyservices;
    try {
      print("Sending request with Category ID: $category_id");

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'category_id': category_id
        }),
      );

      print("Response status code: ${response.statusCode}");
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          return data.map((worker) => worker as Map<String, dynamic>).toList();
        } else {
          throw Exception("Unexpected data format: ${jsonResponse}");
        }
      } else {
        throw Exception("Failed to load data, status code: ${response.statusCode}, message: ${response.body}");
      }
    } catch (e) {
      print("Error occurred: $e");
      throw Exception("Error occurred: $e");
    }
  }
}
