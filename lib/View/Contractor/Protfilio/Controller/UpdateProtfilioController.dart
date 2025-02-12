import 'dart:convert';
import 'dart:developer';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Controller/ServicesProvider.dart';
import 'package:fixit/Core/constant/link_api.dart';
import 'package:fixit/Model/ContractorPortfolio.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddProtfilio extends GetxController {
  NetworkClient client = NetworkClient(http.Client());

  bool isLoading = false;
  RxList<Rating> listrate = <Rating>[].obs;
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString country = ''.obs;
  RxString city = ''.obs;
  RxString streetAddress = ''.obs;
  TextEditingController descriptioncontroller = TextEditingController();
  // Image list
  RxList<XFile> images =
      <XFile>[].obs; // Stores images selected from the gallery

  // Function to pick images from the gallery
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    images.clear();
    var picimages = await picker.pickMultiImage();
    for (var element in picimages) {
      images.add(element);
    }
  }

  Future<void> GetProfile() async {
    isLoading = true;
    update();
    try {
      final response = await client.request(
        path: AppApi.GetProfile,
        requestType: RequestType.GET,
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final data = responseData['data'];
        username.value = data['username'] ?? '';
        email.value = data['email'] ?? '';
        phone.value = data['phone'] ?? '';
        country.value = data['country'] ?? '';
        city.value = data['city'] ?? '';
        streetAddress.value = data['address'] ?? '';
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
        print(
            'Failed to load profile data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      isLoading = false;
      update();
      print("Error fetching profile data: $e");
    }
  }

  Future<void> GetAllMyRating() async {
    isLoading = true;
    update();
    try {
      final response = await client.request(
        path: AppApi.GetAllMyRating,
        requestType: RequestType.GET,
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        for (var element in data['data']) {
          listrate.add(Rating.fromJson(element));
        }
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
        print(
            'Failed to load profile data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      isLoading = false;
      update();
      print("Error fetching profile data: $e");
    }
  }

  Future<void> addprotfilio() async {
    String? token = ServicesProvider.getToken();
    String url = AppLink.update_protfolio;
    final uri = Uri.parse(url);
    final request = http.MultipartRequest('POST', uri);
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['description'] = descriptioncontroller.text;

    if (images.isNotEmpty) {
      for (var image in images) {
        request.files
            .add(await http.MultipartFile.fromPath('images[]', image.path));
      }
    }
    log(request.files.map((e) => e.field).toList().toString());
    final response = await request.send();
    if (response.statusCode == 200) {
      Get.snackbar("Success", "protfilio Add successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar("Success", "protfilio Add successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
     /* Get.snackbar("Faliure", "Profile Add successfully",
          backgroundColor: Colors.red, colorText: Colors.white);*/
    }
  }

  @override
  void onInit() {
    GetProfile();
    GetAllMyRating();
    super.onInit();
  }

  @override
  void dispose() {
    // Get.delete(AddProtfilio());
    super.dispose();
  }
}
