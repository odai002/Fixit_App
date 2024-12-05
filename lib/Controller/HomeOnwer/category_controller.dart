import 'package:fixit/Core/constant/route.dart';
import 'package:get/get.dart';

import '../../data/data_source/Remote/home onwer/contractor_service.dart';

abstract class CategoryController extends GetxController{
  HireNow(int contractor_id);

}
class CategoryControllerImp extends CategoryController {
  var isLoading = false.obs;
  var contractors = <Map<String, dynamic>>[].obs;
  Map<int,String> buttonstate={};
  int? categoryId;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>;
    categoryId = arguments['category_id'];
    if (categoryId != null) {
      fetchContractorsByCategory(categoryId!);
    }
  }
  void fetchContractorsByCategory(int categoryId) async {
    this.categoryId=categoryId;
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
  void HireNow(int contractor_id) async {
    var isTaskSent = await Get.toNamed(
      AppRoute.TaskPage,
      arguments: {'id': contractor_id, 'category_id': categoryId},
    );

    final bool taskSent = Get.arguments?['taskSent'] ?? false;
    print(taskSent);
    if (taskSent == true) {
      updateButtonState(contractor_id, "Hire Again");
    update();
    }
  }



  void updateButtonState(int contractor_id,String newState){
    buttonstate[contractor_id]= newState;
    update();
  }


  void sortContractors(bool ascending) {
    if (ascending) {
      contractors.sort((a, b) => a['average_rating'].compareTo(b['average_rating']));
    } else {
      contractors.sort((a, b) => b['average_rating'].compareTo(a['average_rating']));
    }
    update();
  }  filterItems(int index) {}
}