import 'dart:convert';
import 'dart:developer';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Controller/ServicesProvider.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/HomeOwner/NavigationPageTemplate/Controller/NavigationPageTemplateHomeOwnerController.dart';
import 'package:fixit/View/HomeOwner/NavigationPageTemplate/NavigationPageTemplateHomeOwner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class TaskPageController with ChangeNotifier {
  NetworkClient client = NetworkClient(http.Client());

  GlobalKey<FormState> formstate88 = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController describeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  String selectedCountry = 'Syria';
  String selectedCity = 'Damascus';
  List<XFile> selectedimage = [];

  int? contractor_id;
  initstate(int value) {
    contractor_id = value;
  }

  void showSuccessSnackbar(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Future.delayed(const Duration(milliseconds: 100), () {
      Get.snackbar(
        "Success",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    });
  }

  void showErrorSnackbar(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Future.delayed(const Duration(milliseconds: 100), () {
      Get.snackbar(
        "Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    });
  }

  Future<void> SendTask(BuildContext context) async {
    List<http.MultipartFile> listfiles = [];

    for (var element in selectedimage) {
      listfiles
          .add(await http.MultipartFile.fromPath('images[]', element.path));
    }
    try {
      EasyLoading.show();
      var req = http.MultipartRequest(
        "POST",
        Uri.parse('${AppApi.url}${AppApi.SendTask}'),
      )
        ..fields.addAll({
          'title': titleController.text,
          'description': describeController.text,
          'location': locationController.text,
          'country': selectedCountry,
          'city': selectedCity,
          'contractor_id': contractor_id.toString(),
        })
        ..files.addAll(listfiles)
        ..headers.addAll(
          {
            "Accept": "application/json",
            'Authorization': 'Bearer ${ServicesProvider.getToken()}'
          },
        );
      var response = await req.send();

      var requestbody =
          jsonDecode(utf8.decode(await response.stream.toBytes()));
      if (response.statusCode == 201 || response.statusCode ==200) {
        EasyLoading.dismiss();

        showSuccessSnackbar("Task sent successfully");
        CustomRoute.RouteAndRemoveUntilTo(
            context,
            ChangeNotifierProvider(
              create: (context) => NavigationPageTemplateHomeOwnerController(),
              builder: (context, child) => NavigationPageTemplateHomeOwner(),
            ));
      } else {
        EasyLoading.dismiss();

        showErrorSnackbar("An error occurred: $requestbody");
        log(requestbody.toString());
      }
    } catch (e) {
      EasyLoading.dismiss();

      showErrorSnackbar("An error occurred: $e");
    }
  }

  void selectCountry(String value) {
    selectedCountry = value;
    notifyListeners();
  }

  void selectCity(String value) {
    selectedCity = value;
    notifyListeners();
  }

  Future<void> pickImage() async {
    selectedimage.clear();
    final pickedFile = await ImagePicker().pickMultiImage();
    if (pickedFile.isNotEmpty) {
      selectedimage.addAll(pickedFile);
      notifyListeners();
    }
  }
}
