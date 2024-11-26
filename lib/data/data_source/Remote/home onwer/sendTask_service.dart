import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fixit/data/data_source/Remote/auth/signin_service.dart';

import '../../../../Core/constant/link_api.dart';

class SendTaskService {
  Future<bool> sendTask({
    required String title,
    required String description,
    required String location,
    required String country,
    required String city,
    required int contractorId,
    required List<File> images,
  }) async {
    SigninService signinService = SigninService();
    final String? token = await signinService.getToken();

    try {
      const String url = AppLink.sendTask;
      final uri = Uri.parse(url);
      final request = http.MultipartRequest('POST', uri);

      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['title'] = title;
      request.fields['description'] = description;
      request.fields['location'] = location;
      request.fields['country'] = country;
      request.fields['city'] = city;
      request.fields['contractor_id'] = contractorId.toString();

      if (images.isNotEmpty) {
        for (var image in images) {
          request.files.add(await http.MultipartFile.fromPath('selectedimage[]', image.path));
        }
      }
      final response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Task submitted successfully ${response.statusCode}');
        return true;
      } else {
        print('Failed to submit task ${response.statusCode}}');
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}
