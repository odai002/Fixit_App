import 'dart:io';

import 'package:fixit/Core/constant/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../data/data_source/Remote/auth/signin_service.dart';
class AddProtfilio{
  Future<void> addprotfilio(List<File> images,String description)async{

    SigninService signinService = SigninService();
    final String? token = await signinService.getToken();
    String url = AppLink.update_protfolio;
    final uri=Uri.parse(url);
    final request = http.MultipartRequest('POST', uri);
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['description']=description;

    if (images.isNotEmpty) {
      for (var image in images) {
        request.files.add(await http.MultipartFile.fromPath('selectedimage[]', image.path));
      }
    }
    final response= await request.send();
    if(response.statusCode == 200){
      Get.snackbar("Success", "protfilio Add successfully",backgroundColor:Colors.green,colorText:Colors.white);
    }else{
      Get.snackbar("Faliure", "Profile Add successfully",backgroundColor:Colors.red,colorText:Colors.white);
    }

  }
}