import 'dart:convert';
import 'dart:developer';

import 'package:fixit/Constant/url.dart';
import 'package:fixit/Controller/ServicesProvider.dart';
import 'package:fixit/Model/Category.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:fixit/View/HomeOwner/ContractorPage/ContractorPage.dart';
import 'package:fixit/View/HomeOwner/ContractorPage/Controller/ContractorPageController.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePageController with ChangeNotifier {
  NetworkClient client = NetworkClient(http.Client());
  List<Category> listcategories = [];
  Future<List<Category>> GetCategory() async {
    listcategories.clear();
    try {
      final response = await client.request(
        requestType: RequestType.GET,
        path: AppApi.GetCategory(ServicesProvider.getLocale()),
      );
      log(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (var element in data['data']) {
          listcategories.add(Category.fromJson(element));
        }
        return listcategories;
      } else {
        throw Exception(
            "Failed to load data, status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
      throw Exception("Error occurred: $e");
    }
  }

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
