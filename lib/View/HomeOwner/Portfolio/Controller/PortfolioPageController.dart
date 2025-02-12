import 'dart:convert';
import 'dart:developer';

import 'package:fixit/Constant/url.dart';
import 'package:fixit/Model/ContractorPortfolio.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PortfolioPageController with ChangeNotifier {
  NetworkClient client = NetworkClient(http.Client());
  ContractorPortfolio contractor = ContractorPortfolio();
  bool isLoading = false;
  Future<void> GetProtfilioContractor(int contractorId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await client.request(
        requestType: RequestType.GET,
        path: AppApi.GetProtfilioContractor(contractorId),
      );
      log(response.body.toString());
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        contractor = ContractorPortfolio.fromJson(res['data']);

        isLoading = false;
        notifyListeners();
        // return listcontractor;
      } else {
        isLoading = false;
        notifyListeners();
        log("Error: Failed to load data");
        throw Exception("Failed to load data");
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      log("Error occurred: $e");
      throw Exception("Error occurred: $e");
    }
  }
}
