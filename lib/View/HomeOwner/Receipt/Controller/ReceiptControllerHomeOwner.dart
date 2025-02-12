// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Model/Receipt.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class ReceiptControllerHomeOwner extends ChangeNotifier {
  Receipt? receipt;
  bool isloading = false;
  NetworkClient client = NetworkClient(http.Client());

  Future<void> SendReceiptToReview(int ReceiptId) async {
    EasyLoading.show();
    try {
      final response = await client.request(
        path: AppApi.SendReceiptToReview(ReceiptId),
        requestType: RequestType.POST,
      );
      if (response.statusCode == 200) {
        log("Receipt $ReceiptId accepted.");
        EasyLoading.dismiss();

        getReceiptById(ReceiptId);
      } else {
        EasyLoading.dismiss();
        log("Error accepting Receipt: ${response.body}");
      }
    } catch (e) {
      EasyLoading.dismiss();
      log("Exception in AcceptReceipt: $e");
    }
  }

  Future<void> getReceiptById(int ReceiptId) async {
    log(ReceiptId.toString());
    isloading = true;
    notifyListeners();
    try {
      final res = await client.request(
        path: AppApi.GetReceiptById(ReceiptId),
        requestType: RequestType.GET,
      );

      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        log(data.toString());
        receipt = Receipt.fromJson(data['data']);
        isloading = false;
        notifyListeners();
      } else {
        isloading = false;
        notifyListeners();
        print("Error: Failed to send Receipt");
      }
    } catch (e) {
      isloading = false;
      notifyListeners();
      print("Exception: $e");
      throw Exception(e);
    }
  }
}
