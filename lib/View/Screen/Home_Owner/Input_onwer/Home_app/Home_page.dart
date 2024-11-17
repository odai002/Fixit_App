import 'package:fixit/Controller/HomeOnwer/homepage_controller.dart';
import 'package:fixit/Core/constant/link_api.dart';
import 'package:fixit/Core/function/alert_exit_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Widgets/Custom_App_bar.dart';
import '../../../../Widgets/Custom_Bottom_naf_Bar.dart';
import '../../../../Widgets/Custome_image_Button.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  final HomepageControllerImp controller = Get.put(HomepageControllerImp());

   HomePage({super.key});

  Future<List<Map<String, dynamic>>> getAllservice() async {
    const url = AppLink.getcategory; // ضع الرابط الصحيح هنا
    try {
      final res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(res.body);

/*
        print("Data fetched successfully: $data");
*/

        if (data.containsKey('data') && data['data'] is List) {
          List<dynamic> services = data['data'];

          List<Map<String, dynamic>> categoryData = services
              .map((item) {
            int category_id = item['id'] ?? 0;
            if (category_id == 0) {
              print("Error: category_id is missing or zero in item: $item");
            }
            return {
              'id': category_id,
              'category_name': item['category_name'],
            };
          })
              .toList();

          return categoryData;
        } else {
          throw Exception("No 'data' field found or it's not a list");
        }
      } else {
        throw Exception("Failed to load data, status code: ${res.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
      throw Exception("Error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: SnackBarBody(),
      appBar: CustomAppBar(title: ''),
      resizeToAvoidBottomInset: false,
      body: WillPopScope(onWillPop:AlertExitApp,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(child: _buildRichText("Pick a")),
                      SizedBox(width: screenWidth * 0.01),
                      Flexible(child: _buildRichText("Service", color: const Color(0xff6A3BA8))),
                      SizedBox(width: screenWidth * 0.01),
                      Flexible(child: _buildRichText("that you need!")),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.05),
                  child:FutureBuilder<List<Map<String, dynamic>>>(
                    future: getAllservice(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        List<Map<String, dynamic>> categoryData = snapshot.data!;

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: screenWidth * 0.05,
                            mainAxisSpacing: screenHeight * 0.04,
                            childAspectRatio: 1,
                          ),
                          itemCount: categoryData.length,
                          itemBuilder: (context, index) {
                            var category_id = categoryData[index]['id']; // استخراج الـ category_id
                            category_id ??= 0;

                            return _buildImageButton(
                              context,
                              _getImagePathForCategory(categoryData[index]['category_name']),
                              categoryData[index]['category_name'],
                              category_id,  // تمرير الـ category_id هنا
                            );

                          },
                        );
                      } else {
                        return const Center(child: Text("No data available")); // في حالة عدم وجود بيانات
                      }
                    },
                  )


                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // بناء النص الغني (RichText)
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

  Widget _buildImageButton(BuildContext context, String imagePath, String text, int category_id) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ImageTextButton(
        onPressed: () {
          if (category_id == 0) {
            print("Error: category_id is zero when clicked");
          } else {
            print("Category ID clicked: $category_id");
            controller.Imagetextbutton(category_id);  // تمرير category_id بشكل صحيح هنا
          }
        },
        image: AssetImage(imagePath),
        text: text,
      ),
    );
  }

  String _getImagePathForCategory(String categoryName) {
    switch (categoryName) {
      case 'Carpenter':
        return 'assets/1.png';
      case 'Roof Repair':
        return 'assets/15.png';
      case 'Movers':
        return 'assets/2.png';
      case 'Air Conditioning':
        return 'assets/13.jpg';
      case 'Plumbing':
        return 'assets/14.png';
      case 'HVAC':
        return 'assets/5.jpg';
      case 'Landscaping':
        return 'assets/6.jpg';
      case 'Cleaning':
        return 'assets/7.jpg';
      case 'Snow Removal':
        return 'assets/8.jpg';
      case 'Electrician':
        return 'assets/9.jpg';
      case 'Handyman':
        return 'assets/11.jpg';
      case 'Flooring':
        return 'assets/12.jpg';
      default:
        return 'assets/U.png';
    }
  }
}