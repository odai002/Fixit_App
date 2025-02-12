// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'dart:io';
import 'package:fixit/Constant/colors.dart';
import 'package:fixit/View/Contractor/Protfilio/Controller/UpdateProtfilioController.dart';
import 'package:fixit/View/Widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // Static content variables
  final String profession = "132".tr;
  final String descriptionHint = "135".tr;
  final String reviewTitle = "136".tr;
  final double overallRating = 4.5;

  // Review content
  final String reviewerName = "137".tr;
  final double reviewerRating = 3.5;
  final String reviewDate = "138".tr;
  final String reviewDescription = "139".tr;

  // Custom color
  final Color primaryColor = const Color(0xff6A3BA8); // Updated purple color

  @override
  Widget build(BuildContext context) {
    AddProtfilio controller = Get.put(AddProtfilio());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Obx(
          () => Row(
            children: [
              Icon(Icons.location_on, color: primaryColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${controller.country.value} / ${controller.city.value} / ${controller.streetAddress.value}',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image grid with add button
                Obx(
                  () => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: controller.images.value.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return GestureDetector(
                          onTap: () => controller.pickImage(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:
                                Icon(Icons.add, color: primaryColor, size: 40),
                          ),
                        );
                      }
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(controller.images.value[index - 1].path),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () {
                                controller.images.removeAt(index - 1);
                              },
                              child: const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // User details
                Obx(
                  () => Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[300],
                        child: const Icon(Icons.person,
                            size: 40, color: Colors.grey),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.username}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            profession,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone, size: 16, color: primaryColor),
                              const SizedBox(width: 4),
                              Text("${controller.phone}"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.email, size: 16, color: primaryColor),
                              const SizedBox(width: 4),
                              Text("${controller.email}"),
                            ],
                          ),
                        ],
                      ),
                      // IconButton(
                      //   icon: Icon(Icons.edit, color: primaryColor),
                      //   onPressed: () {
                      //     // Edit profile functionality
                      //   },
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Description
                Text("140".tr, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                CustomTextField(
                  maxLength: 200,
                  name: "140".tr,
                  inputType: TextInputType.text,
                  line: 4,
                  controller: controller.descriptioncontroller,
                  // decoration: InputDecoration(

                  //   hintText: descriptionHint,
                  //   border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(8),
                  //   ),
                  // ),
                ),
                const SizedBox(height: 16),
                // Reviews section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "205 (${controller.listrate.length})".tr,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 8),
                        // Row(
                        //   children: List.generate(
                        //     5,
                        //     (i) => Icon(
                        //       Icons.star,
                        //       size: 16,
                        //       color: i < overallRating.floor()
                        //           ? Colors.yellow
                        //           : Colors.grey,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     // See more reviews
                    //   },
                    //   child: Text("140".tr),
                    // ),
                  ],
                ),
                const SizedBox(height: 8),
                // Single Review
                Obx(() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.listrate.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  spreadRadius: 0,
                                  offset: Offset.fromDirection(90),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.asset(
                                'assets/U.png',
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                          title: Text(
                            controller.listrate[index].username!,
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: List.generate(5, (indexx) {
                                  return Icon(Icons.star,
                                      color: indexx <
                                              controller.listrate[index].rate!
                                          ? AppColors.starcolorreview
                                          : AppColors.grey100,
                                      size: 15.w);
                                }),
                              ),
                              SizedBox(height: 4),
                              Text(
                                controller.listrate[index].comment!,
                                style: GoogleFonts.roboto(fontSize: 10),
                              ),
                            ],
                          ),
                          // trailing: Text(
                          //   "Today",
                          //   style: GoogleFonts.roboto(
                          //       color: Colors.grey, fontSize: 10),
                          // ),
                        ),
                      ),
                    )),
                Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () => controller.addprotfilio(),
                          child: Text("209".tr)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
/*
      bottomNavigationBar: SnackBarBody(),
*/
    );
  }
}
