import 'dart:convert';
import 'dart:developer';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Model/Contract.dart';
import 'package:fixit/Services/NetworkClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ContractControllerHomeOwner extends ChangeNotifier {
  Contract? contract;
  bool isloading = false;
  NetworkClient client = NetworkClient(http.Client());

  Future<bool> AcceRejContract(int contractId, bool status) async {
    try {
      final response = await client.request(
        path: AppApi.AcceRejContract(contractId),
        requestType: RequestType.POST,
        body: jsonEncode({
          'status': status,
          'id': contractId,
        }),
      );
      if (response.statusCode == 200) {
        log("Contract $contractId accepted.");
        getContractById(contractId);

        return true;
      } else {
        log("Error accepting contract: ${response.body}");
        return false;
      }
    } catch (e) {
      log("Exception in AcceptContract: $e");
      return false;
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
}
