import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Controller/HomeOnwer/category_controller.dart';
import '../../../../../Widgets/Custom_App_bar.dart';
import '../../../../../Widgets/Custom_Bottom_naf_Bar.dart';
import '../../../../../Widgets/Custom_Card_Widget.dart';
import '../Category_Page/Category_Page_Components/Custom_Sorting_Text_B.dart';

class CategoryPage extends StatelessWidget {
  bool ascending = true;
  CategoryPage({super.key});
  final int categoryId = Get.arguments['category_id'];

  @override
  Widget build(BuildContext context) {
    CategoryControllerImp controller = Get.put(CategoryControllerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: '13'.tr,
      ),
      bottomNavigationBar: SnackBarBody(),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SortingSegmentedControl(
              title: '14'.tr,
              buttonCaption: '15'.tr,
              onSelectionChanged: (int index) => controller.filterItems(index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: SortingSegmentedControl(
              title: '16'.tr,
              buttonCaption: '17'.tr,
              onSelectionChanged: (int index) => controller.sortContractors(ascending),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.contractors.isEmpty) {
                return Center(child: Text('18'.tr));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(25.0),
                itemCount: controller.contractors.length,
                itemBuilder: (context, index) {
                  final contractor = controller.contractors[index];
                  final contractor_id = contractor['id'];
                  String buttonText = controller.buttonstate[contractor_id] ?? '19'.tr;

                  return SingleChildScrollView(
                    child: CustomCard(
                      image: Image.asset('assets/U.png'),
                      email: contractor['email'],
                      desc: contractor['description'] ?? "20".tr,
                      number: contractor['phone'],
                      name: contractor['username'],
                      category: contractor['category'],
                      local: "${contractor['city']}, ${contractor['country']}",
                      buttonText: buttonText,
                      id: contractor['id'],
                      onPressed: (id) {
                        controller.HireNow(contractor_id);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
