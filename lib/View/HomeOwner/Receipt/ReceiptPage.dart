// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit/Constant/colors.dart';
import 'package:fixit/Constant/text_styles.dart';
import 'package:fixit/Core/constant/link_api.dart';
import 'package:fixit/View/HomeOwner/Receipt/Controller/ReceiptControllerHomeOwner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReceiptPageHomeOwner extends StatelessWidget {
  ReceiptPageHomeOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "114".tr,
                style: GoogleFonts.getFont(
                  'Libre Caslon Text',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: const Color(0xff000000),
                ),
              ),
            ]),
          ),
        ),
        leading: BackButton(
          color: Colors.black, // Customizing the color of the back button
          onPressed: () {
            Get.back();
          },
          // You can also customize the icon by providing a different icon widget
          // icon: Icon(Icons.arrow_back),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Consumer<ReceiptControllerHomeOwner>(
        builder: (context, controller, child) => controller.isloading
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(32.2),
                    child: Column(
                      children: [
                        const SizedBox(height: 13),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "22".tr,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ]),
                              ),
                              const SizedBox(width: 12),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: controller
                                        .receipt!.contract!.task!.title,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 23),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "123".tr,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ]),
                              ),
                              const SizedBox(width: 12),
                              Text(controller.receipt!.contract!.paymentDate!),
                            ],
                          ),
                        ),
                        const SizedBox(height: 33),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "24".tr,
                                      style: GoogleFonts.getFont(
                                        'Libre Caslon Text',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              const SizedBox(height: 22),
                              Container(
                                height: 220,
                                width: 400,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 12,
                                          spreadRadius: 0.5,
                                          offset: Offset.fromDirection(90))
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 22, top: 22, right: 14, bottom: 14),
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: controller.receipt!.contract!
                                            .task!.description!,
                                        style: GoogleFonts.getFont(
                                          'Libre Caslon Text',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 33),
                        Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "28".tr,
                                style: GoogleFonts.getFont(
                                  'Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: 100,
                            child: Row(
                              children: [
                                Wrap(
                                  children: controller
                                      .receipt!.contract!.task!.taskImage!
                                      .map((imageUrl) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                        width: 100,
                                        height: 100,
                                        imageUrl:
                                            '${AppLink.Category}${imageUrl.image!.name}',
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) {
                                          return Container(
                                            color: Colors.grey[300],
                                            child: const Icon(
                                                Icons.broken_image,
                                                color: Colors.red),
                                          );
                                        },
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(width: 12),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 33),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "125".tr,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ]),
                              ),
                              const SizedBox(width: 12),
                              Text("${controller.receipt!.contract!.price!}")
                            ],
                          ),
                        ),
                        const SizedBox(height: 33),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "202".tr,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ]),
                              ),
                              const SizedBox(width: 12),
                              Text("${controller.receipt!.amount!}")
                            ],
                          ),
                        ),
                        const SizedBox(height: 33),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "127".tr,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ]),
                              ),
                              const SizedBox(width: 12),
                              Text("${controller.receipt!.contract!.endDate}")
                            ],
                          ),
                        ),
                        const SizedBox(height: 33),
                        Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "128".tr,
                                style: GoogleFonts.getFont(
                                  'Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 12,
                                        spreadRadius: 0.5,
                                        offset: Offset.fromDirection(90))
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: controller
                                            .receipt!.contract!.task!.country!,
                                        style: GoogleFonts.getFont(
                                          'Libre Caslon Text',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 12,
                                          spreadRadius: 0.5,
                                          offset: Offset.fromDirection(90))
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: controller
                                              .receipt!.contract!.task!.city!,
                                          style: GoogleFonts.getFont(
                                            'Libre Caslon Text',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: const Color(0xff000000),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 33),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 50,
                            width: 400,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(11),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 12,
                                      spreadRadius: 0.5,
                                      offset: Offset.fromDirection(90))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 22, right: 12, top: 15),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: controller
                                        .receipt!.contract!.task!.location,
                                    style: GoogleFonts.getFont(
                                      'Libre Caslon Text',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: 100,
                            child: Row(
                              children: [
                                Wrap(
                                  children: controller.receipt!.receiptImage!
                                      .map((imageUrl) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                        width: 100,
                                        height: 100,
                                        imageUrl:
                                            '${AppLink.Category}${imageUrl.image!.name}',
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) {
                                          return Container(
                                            color: Colors.grey[300],
                                            child: const Icon(
                                                Icons.broken_image,
                                                color: Colors.red),
                                          );
                                        },
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(width: 12),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        // if (controller.receipt!.contract!.status == null)
                        if (controller.receipt!.forReview == 0)
                          GestureDetector(
                            onTap: () => controller.SendReceiptToReview(
                                controller.receipt!.id!),
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff6A3BA8),
                                  ),
                                  color: AppColors.active,
                                  borderRadius: BorderRadius.circular(11),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 0.5,
                                        spreadRadius: 0.5,
                                        offset: Offset.fromDirection(90))
                                  ]),
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: Text('203'.tr,
                                    style: TextStyles.button),
                              ),
                            ),
                          ),
                        if (controller.receipt!.forReview == 1)
                          Text(
                              "204".tr),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
