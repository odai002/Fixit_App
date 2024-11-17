import 'package:fixit/data/data_source/Remote/home%20onwer/contractor_service.dart';
import 'package:get/get.dart';
import 'package:fixit/Core/constant/route.dart';

class HomepageControllerImp extends GetxController {
  var isLoading = true.obs;

  final List<Map<String, String>> images = [
    {'title': 'Carpenter', 'image': 'assets/1.png'},
    {'title': 'Movers', 'image': 'assets/2.png'},
    {'title': 'Air Conditioning', 'image': 'assets/13.jpg'},
    {'title': 'Plumbing', 'image': 'assets/14.png'},
    {'title': 'HVAC', 'image': 'assets/5.jpg'},
    {'title': 'Landscaping', 'image': 'assets/6.jpg'},
    {'title': 'Cleaning', 'image': 'assets/7.jpg'},
    {'title': 'Snow Removal', 'image': 'assets/8.jpg'},
    {'title': 'Electrician', 'image': 'assets/9.jpg'},
    {'title': 'Handyman', 'image': 'assets/11.jpg'},
    {'title': 'Flooring', 'image': 'assets/12.jpg'},
    {'title': 'Roof Repair', 'image': 'assets/15.jpg'},
  ];

  Future<void> Imagetextbutton(int category_id) async {
    print("Sending request with Category ID: $category_id");
    if (category_id == 0) {
      print("Error: category_id is zero or not set.");
      return;
    }

    try {
      print("Category ID: $category_id");
      ContractorService contractorService = ContractorService();
      List<Map<String, dynamic>> contractors = await contractorService.getContractorByCategoryName(category_id);
      print("Contractors: $contractors");

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
