import 'dart:convert';
import 'package:fixit/data/data_source/Remote/auth/signin_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import '../../Core/constant/link_api.dart';
import '../../Core/constant/route.dart';

class ContractController extends GetxController{
   late  TextEditingController dateController;
  late TextEditingController priceController ;
  late TextEditingController deadlineController ;
   late final Map<String, dynamic> taskData;

   Future<void> sendContract(int taskId) async {
     try {
       SigninService signinService = SigninService();
       String? token = await signinService.getToken();

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

       if (res.statusCode == 200 || res.statusCode == 201) {
         print("SendContract Successful");
         Get.offNamed(AppRoute.ContractorHomePage);
       } else {
         print("Error: Failed to send contract");
       }
     } catch (e) {
       print("Exception: $e");
       throw Exception(e);
     }
   }
@override
  void onInit() {
    super.onInit();
          dateController =TextEditingController();
          priceController =TextEditingController();
          deadlineController =TextEditingController();
          taskData = Get.arguments['task'];

}
  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    priceController.dispose();
    deadlineController.dispose();
  }
}