import 'package:get/get.dart';
import 'package:fixit/data/data_source/Remote/home%20onwer/all_mycontracts.dart';

class NotificationController extends GetxController {
  var contracts = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  final getAllMyContracts _service = getAllMyContracts();

  @override
  void onInit() {
    super.onInit();
    fetchContracts();
  }

  void fetchContracts() async {
    try {
      isLoading(true);
      var fetchedContracts = await _service.getMyContractors();
      contracts.value = fetchedContracts;
    } catch (e) {
      print("Error fetching contracts: $e");
    } finally {
      isLoading(false);
    }
  }
}