import 'dart:convert';
import 'package:fixit/data/data_source/Remote/auth/signin_service.dart';
import 'package:http/http.dart' as http;
import '../../../../Core/constant/link_api.dart';

class ContractorService {
  bool isloading = true;

  Future<List<Map<String, dynamic>>> getContractorByCategoryName(
      int category_id) async {
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();

    const String url = AppLink.getcontractorsbyservices;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'category_id': category_id}),
      );



      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          return data.map((worker) => worker as Map<String, dynamic>).toList();
        } else {
          throw Exception("Unexpected data format: $jsonResponse");
        }
      } else {
        print("Error: Failed to load data");
        throw Exception(
            "Failed to load data");
      }
    } catch (e) {
      print("Error occurred: $e");
      throw Exception("Error occurred: $e");
    }
  }





  Future<List<Map<String, dynamic>>> getAllservice() async {
    SigninService signinService = SigninService();
    String? token = await signinService.getToken();
    const url = AppLink.getcategory;
    String baseUrl = AppLink.Category;
    try {
      final res = await http.get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});

      if (res.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(res.body);

        if (data.containsKey('data') && data['data'] is List) {
          List<dynamic> services = data['data'];

          List<Map<String, dynamic>> categoryData = services.map((item) {
            int category_id = item['id'] ?? 0;
            String category_name = item['category_name'] ?? '';
            String image_path = item['image'] ?? 'No images'; // Fallback image
            String image_fullUrl = image_path.contains('http') ? image_path : "$baseUrl$image_path";

            return {
              'id': category_id,
              'category_name': category_name,
              'image': image_fullUrl,
            };
          }).toList();

          return categoryData;
        } else {
          throw Exception("No 'data' field found or it's not a list");
        }
      } else {
        throw Exception("Failed to load data, status code: ${res.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
      throw Exception("Error occurred: $e");
    }
  }


}
