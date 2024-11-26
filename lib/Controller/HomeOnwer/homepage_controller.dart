
import 'package:fixit/data/data_source/Remote/home%20onwer/contractor_service.dart';
import 'package:get/get.dart';
import 'package:fixit/Core/constant/route.dart';

class HomepageControllerImp extends GetxController {
  var isLoading = true.obs;


  Future<void> Imagetextbutton(int category_id) async {
    if (category_id == 0) {
      return;
    }

    try {
      print("Category ID: $category_id");
      ContractorService contractorService = ContractorService();
      List<Map<String, dynamic>> contractors = await contractorService.getContractorByCategoryName(category_id);
      Get.toNamed(AppRoute.CategoryPage, arguments: {'category_id': category_id, 'contractors': contractors});
    } catch (e) {
      print("Error fetching contractors: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
