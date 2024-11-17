import 'package:fixit/Core/constant/route.dart';
import 'package:get/get.dart';

import '../../data/data_source/Remote/home onwer/contractor_service.dart';

abstract class CategoryController extends GetxController{
  HireNow(int contractor_id);

}
class CategoryControllerImp extends CategoryController {
  var isLoading = false.obs;
  var contractors = <Map<String, dynamic>>[].obs;

  void fetchContractorsByCategory(int categoryId) async {
    isLoading.value = true;
    try {
      ContractorService contractorService = ContractorService();
      contractors.value =
      await contractorService.getContractorByCategoryName(categoryId);

    } catch (e) {
      print("Error fetching contractors: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void HireNow(int contractor_id,) async {
    print("Contractor ID: $contractor_id");
     Get.toNamed(
      AppRoute.TaskPage,
      arguments: {'id': contractor_id},
    );

    update();
  }

  sortItems(int index) {}

  filterItems(int index) {}

}