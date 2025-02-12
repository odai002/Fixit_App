// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:fixit/Controller/ServicesProvider.dart';
import 'package:fixit/Model/Task.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/Contractor/NavigationPageTemplate/Controller/NavigationPageTemplateHomeOwnerController.dart';
import 'package:fixit/View/Contractor/NavigationPageTemplate/NavigationPageTemplateContractor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../../Core/constant/link_api.dart';

class ContractPageContractorController extends ChangeNotifier {
  TextEditingController dateController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  Task? taskData;

  initstate(Task task) {
    taskData = task;
  }


  Future<void> sendContract(BuildContext context, int taskId) async {
    try {
      String? token = ServicesProvider.getToken();

      if (token == null || token.isEmpty) {
        showErrorSnackbar("Authentication token is missing.");
        return;
      }

      final url = Uri.parse(AppLink.sendContract(taskId));

      final res = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'payment_date': dateController.text,
          'price': double.tryParse(priceController.text),
          'end_date': deadlineController.text,
        }),
      );

      print("Status Code: ${res.statusCode}");
      print("Body is: ${res.body}");

      if (res.statusCode == 200 || res.statusCode == 201) {
        EasyLoading.dismiss();

        showSuccessSnackbar("Contract sent successfully");
        CustomRoute.RouteAndRemoveUntilTo(
          context,
          ChangeNotifierProvider(
            create: (context) => NavigationPageTemplateContractorController(),
            builder: (context, child) => NavigationPageTemplateContractor(),
          ),
        );
      } else if (res.statusCode == 302) {
        // معالجة إعادة التوجيه يدويًا
        final redirectUrl = res.headers['location'];
        print("Redirect to: $redirectUrl");
        showErrorSnackbar("Redirected to: $redirectUrl");
      } else {
        EasyLoading.dismiss();
        showErrorSnackbar("An error occurred: ${res.statusCode} ${res.body}");
      }
    } catch (e) {
      print("Exception: $e");
      showErrorSnackbar("Exception occurred: $e");
    }
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
    @override
    void dispose() {
      super.dispose();
      dateController.dispose();
      priceController.dispose();
      deadlineController.dispose();
    }
}