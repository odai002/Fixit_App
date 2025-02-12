import 'dart:convert';
import 'dart:developer';

import 'package:fixit/Constant/url.dart';
import 'package:fixit/Controller/ServicesProvider.dart';
import 'package:fixit/Model/Contractor.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/HomeOwner/TaskPage/Controller/TaskPageController.dart';
import 'package:fixit/View/HomeOwner/TaskPage/TaskPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ContractorPageController with ChangeNotifier {
  NetworkClient client = NetworkClient(http.Client());
  bool isLoading = false;
  List<Contractor> listcontractor = [];
  Future<void> getContractorByCategoryName(int category_id) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await client.request(
        requestType: RequestType.POST,
        path: AppApi.GetContractorsByServices(ServicesProvider.getLocale()),
        body: jsonEncode({'category_id': category_id}),
      );
      log(response.body.toString());
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        for (var element in res['data']) {
          listcontractor.add(Contractor.fromJson(element));
        }
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

  ToSendTaskPage(BuildContext context, int contractor_id) {
    CustomRoute.RouteTo(
        context,
        ChangeNotifierProvider(
          create: (context) => TaskPageController()..initstate(contractor_id),
          builder: (context, child) => TaskPage(),
        ));
  }
}
