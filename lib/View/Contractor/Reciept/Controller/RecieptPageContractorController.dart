// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Controller/ServicesProvider.dart';
import 'package:fixit/Model/Contract.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/Contractor/NavigationPageTemplate/Controller/NavigationPageTemplateHomeOwnerController.dart';
import 'package:fixit/View/Contractor/NavigationPageTemplate/NavigationPageTemplateContractor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RecieptPageContractorController extends ChangeNotifier {
  Contract? contract;
  bool isloading = false;
  NetworkClient client = NetworkClient(http.Client());
  TextEditingController priceController = TextEditingController();
  List<XFile?> taskDonePictures = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    taskDonePictures.clear();
    List<XFile>? images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      taskDonePictures.addAll(images);
      notifyListeners();
    }
  }

  Future<void> getContractById(int contractId) async {
    log(contractId.toString());
    isloading = true;
    notifyListeners();
    try {
      final res = await client.request(
        path: AppApi.GetContractById(contractId),
        requestType: RequestType.GET,
      );

      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        log(data.toString());
        contract = Contract.fromJson(data['data']);
        isloading = false;
        notifyListeners();
      } else {
        isloading = false;
        notifyListeners();
        print("Error: Failed to send contract");
      }
    } catch (e) {
      isloading = false;
      notifyListeners();
      print("Exception: $e");
      throw Exception(e);
    }
  }

  Future<void> SendReceipt(BuildContext context, int contractId) async {
    List<http.MultipartFile> listfiles = [];

    for (var element in taskDonePictures) {
      listfiles
          .add(await http.MultipartFile.fromPath('images[]', element!.path));
    }
    try {
      EasyLoading.show();
      var req = http.MultipartRequest(
        "POST",
        Uri.parse('${AppApi.url}${AppApi.SendReceipt(contractId)}'),
      )
        ..fields.addAll({
          'contract_id': contractId.toString(),
          'amount': priceController.text,
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
      if (response.statusCode == 201) {
        EasyLoading.dismiss();

        // showSuccessSnackbar("Task sent successfully");
        CustomRoute.RouteAndRemoveUntilTo(
            context,
            ChangeNotifierProvider(
              create: (context) => NavigationPageTemplateContractorController(),
              builder: (context, child) => NavigationPageTemplateContractor(),
            ));
      } else {
        EasyLoading.dismiss();

        // showErrorSnackbar("An error occurred: $requestbody");
        log(requestbody.toString());
      }
    } catch (e) {
      EasyLoading.dismiss();

      // showErrorSnackbar("An error occurred: $e");
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   dateController = TextEditingController();
  //   priceController = TextEditingController();
  //   deadlineController = TextEditingController();
  //   taskData = Get.arguments['task'];
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   dateController.dispose();
  //   priceController.dispose();
  //   deadlineController.dispose();
  // }
}
