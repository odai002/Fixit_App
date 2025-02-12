// ignore_for_file: library_prefixes, use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:http/http.dart' as http;
import 'package:fixit/Model/Notification.dart' as Noti;

class NotificationPageContractorController with ChangeNotifier {
  NetworkClient client = NetworkClient(http.Client());
  List<Noti.Notification> listnotification = [];
  Future<List<Noti.Notification>> getMyNotification() async {
    listnotification.clear();
    try {
      final response = await client.request(
        path: AppApi.GetMyNotification,
        requestType: RequestType.GET,
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        log(data.toString());
        for (var element in data['data']) {
          listnotification.add(Noti.Notification.fromJson(element));
        }
        return listnotification;
      } else {
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      log("Error fetching notifications: $e");
      throw Exception("Error occurred: $e");
    }
  }
}
