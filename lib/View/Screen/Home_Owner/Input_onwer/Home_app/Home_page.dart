import 'package:fixit/Controller/HomeOnwer/homepage_controller.dart';
import 'package:fixit/Core/function/alert_exit_app.dart';
import 'package:fixit/data/data_source/Remote/home%20onwer/contractor_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Widgets/Custom_App_bar.dart';
import '../../../../Widgets/Custom_Bottom_naf_Bar.dart';
import '../../../../Widgets/Custome_image_Button.dart';

class HomePage extends StatelessWidget {
  final HomepageControllerImp controller = Get.put(HomepageControllerImp());
  ContractorService contractorService =ContractorService();

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnackBarBody(),
      appBar: CustomAppBar(title: ''),
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: AlertExitApp,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
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
                      Flexible(child: _buildRichText("2".tr, color: const Color(0xff6A3BA8))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: contractorService.getAllservice(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(child: Text('Error: please try again'));
                      } else if (snapshot.hasData) {
                        List<Map<String, dynamic>> categoryData = snapshot.data!;

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            childAspectRatio: 1,
                          ),
                          itemCount: categoryData.length,
                          itemBuilder: (context, index) {
                            var imageUrl = categoryData[index]['image'];
                            var text = categoryData[index]['category_name'];

                            return _buildImageButton(
                              context,
                              imageUrl,
                              text,
                              categoryData[index]['id'],
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text("No data available"));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRichText(String text, {Color color = const Color(0xff000000)}) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: GoogleFonts.getFont(
              'Libre Caslon Text',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageButton(BuildContext context, String urlImage, String text, int category_id) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ImageTextButton(
        onPressed: () {
          if (category_id == 0) {
            print("Error: category_id is zero when clicked");
          } else {
            print("Category ID clicked: $category_id");
            controller.Imagetextbutton(category_id);
          }
        },
        image: urlImage,
        text: text,
        onError: (error) {
          print('Error loading image: $error');
        },
      ),
    );
  }
}
