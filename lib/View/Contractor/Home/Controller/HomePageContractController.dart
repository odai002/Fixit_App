// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:fixit/Constant/url.dart';
import 'package:fixit/Model/Task.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/HomeOwner/ContractorPage/ContractorPage.dart';
import 'package:fixit/View/HomeOwner/ContractorPage/Controller/ContractorPageController.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePageContractorController with ChangeNotifier {
  NetworkClient client = NetworkClient(http.Client());
  List<Task> listtask = [];
  bool isloading = false;

  Future<void> GetMyTasks() async {

    isloading = true;

    notifyListeners();
    listtask.clear();
    try {
      final response = await client.request(
        requestType: RequestType.GET,
        path: AppApi.GetMyTasks,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        log(data.toString());
        for (var element in data['data']) {
          listtask.add(Task.fromJson(element));
        }
        isloading = false;
        notifyListeners();
      } else {
        isloading = false;
        notifyListeners();
        throw Exception(
            "Failed to load data, status code: ${response.statusCode}");
      }
    } catch (e) {
      isloading = false;
      notifyListeners();
      print("Error occurred: $e");
      throw Exception("Error occurred: $e");
    }
  }

  Future<bool> AccRejTask(int taskId, bool status) async {
    try {
      final response = await client.request(
        path: AppApi.AccRejTask(taskId),
        requestType: RequestType.POST,
        body: jsonEncode({
          'status': status,
          'id': taskId,
        }),
      );
      if (response.statusCode == 200) {
        print("Task with ID $taskId deleted successfully.");
        GetMyTasks();
        return true;
      } else {
        throw Exception('Failed to delete task');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  // Future<bool> acceptTask(int taskId) async {
  //   // SigninService signInService = SigninService();
  //   String? token = ServicesProvider.getToken();
  //   final url = Uri.parse(AppLink.acceptTask(taskId));
  //   try {
  //     print("Accept Task with ID: $taskId");

  //     final response = await http.post(url,
  //         body: jsonEncode({
  //           'status': true,
  //           'id': taskId,
  //         }),
  //         headers: {
  //           'Content-Type': 'application/json',
  //           "Authorization": "Bearer $token"
  //         });
  //     print("taskid is :$taskId");
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseBody = json.decode(response.body);
  //       final taskData = responseBody['data'];
  //       log(taskData.toString());
  //       Get.toNamed(AppRoute.ContractPage, arguments: {
  //         'task': taskData,
  //       });
  //       print("Task with ID $taskId accept successfully.");
  //       return true;
  //     } else {
  //       print("Error: ${response.statusCode} - ${response.body}");
  //       throw Exception('Failed to accept task');
  //     }
  //   } catch (e) {
  //     print('Error in AcceptTask: $e');
  //     throw Exception('Error occurred: $e');
  //   }
  // }

  ToContractorsPage(BuildContext context, int categoryId) {
    CustomRoute.RouteTo(
        context,
        ChangeNotifierProvider(
          create: (context) => ContractorPageController()
            ..getContractorByCategoryName(categoryId),
          builder: (context, child) => ContractorsPage(),
        ));
  }
}
