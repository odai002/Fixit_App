import 'package:fixit/Constant/colors.dart';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/Core/function/alert_exit_app.dart';
import 'package:fixit/Model/Category.dart';
import 'package:fixit/View/HomeOwner/Home/Controller/HomePageController.dart';
import 'package:fixit/View/Widgets/Custom_App_bar.dart';
import 'package:fixit/View/Widgets/Custome_image_Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageController(),
      builder: (context, child) => Consumer<HomePageController>(
        builder: (context, controller, child) => Scaffold(
          // bottomNavigationBar: SnackBarBody(),
          appBar: CustomAppBar(title: ''),
          // resizeToAvoidBottomInset: false,
          body: PopScope(
            onPopInvoked: (didPop) {
              AlertExitApp();
            },
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                              child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "2".tr,
                                  style: GoogleFonts.getFont(
                                    'Libre Caslon Text',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.active,
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: FutureBuilder<List<Category>>(
                        future: controller.GetCategory(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return const Center(
                                child: Text('Error: please try again'));
                          } else if (snapshot.hasData) {
                            List<Category> categoryData = snapshot.data!;

                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                                childAspectRatio: 1,
                              ),
                              itemCount: categoryData.length,
                              itemBuilder: (context, index) {
                                var imageUrl = categoryData[index].image;
                                var text = categoryData[index].categoryName;

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: ImageTextButton(
                                    onPressed: () {
                                      if (categoryData[index].id == 0) {
                                        print(
                                            "Error: category_id is zero when clicked");
                                      } else {
                                        controller.ToContractorsPage(
                                            context, categoryData[index].id!);
                                      }
                                    },
                                    image: '${AppApi.imageurl}$imageUrl',
                                    text: text!,
                                    onError: (error) {
                                      print('Error loading image: $error');
                                    },
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
                                child: Text("No data available"));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
