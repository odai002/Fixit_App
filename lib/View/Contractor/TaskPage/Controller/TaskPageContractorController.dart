// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Model/Task.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskPageContractorController with ChangeNotifier {
  NetworkClient client = NetworkClient(http.Client());
  bool isloading = false;
  Task? task;

  Future<void> GetTaskById(int taskId) async {
    isloading = true;
    notifyListeners();
    try {
      final res = await client.request(
        path: AppApi.GetTaskById(taskId),
        requestType: RequestType.GET,
      );

      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        log(data.toString());
        task = Task.fromJson(data['data']);
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
}
