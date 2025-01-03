import 'dart:developer';
import 'package:get/get.dart';
import 'package:fixit/data/data_source/Remote/home%20onwer/all_mycontracts.dart';

class NotificationController extends GetxController {
  var contracts = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  final getAllMyContracts service = getAllMyContracts();

  @override
  void onInit() {
    log("NotificationController initialized");
    fetchContracts();
    super.onInit();
  }

  void fetchContracts() async {
    log("fetchContracts called");
    try {
      isLoading(true);
      var fetchedContracts = await service.getMyContractors();
      log("Fetched Contracts: $fetchedContracts");
      contracts.value = fetchedContracts;
      log("Contracts updated: $contracts");
    } catch (e) {
      log("Error fetching contracts: $e");
      log("Error details: ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }
}
