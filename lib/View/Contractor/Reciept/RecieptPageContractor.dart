import 'dart:io';

import 'package:fixit/Constant/text_styles.dart';
import 'package:fixit/Constant/url.dart';
import 'package:fixit/View/Contractor/Reciept/Controller/RecieptPageContractorController.dart';
import 'package:fixit/View/Widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Widgets/Custom_Button.dart';

class RecieptPageContractor extends StatelessWidget {
  const RecieptPageContractor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "210".tr,
          style: TextStyles.title,
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
      body: Consumer<RecieptPageContractorController>(
        builder: (context, controller, child) => controller.isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
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
                                    text: controller.contract!.task!.title,
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
                              Text(controller.contract!.paymentDate!),
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
                                        text: controller
                                            .contract!.task!.description,
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
                                  children: controller.contract!.task!.taskImage
                                          ?.map((imageUrl) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            "${AppApi.imageurl}${imageUrl.image!.name!}",
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }).toList() ??
                                      [],
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
                              Text(controller.contract!.price!.toString()),
                            ],
                          ),
                        ),
                        const SizedBox(height: 33),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            children: [
                              Text(
                                '202'.tr,
                                style: GoogleFonts.getFont(
                                  'Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color(0xff000000),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 2,
                                child: CustomTextField(
                                  name: "126".tr,
                                  // maxLine: 1,
                                  // hint: "126".tr,
                                  maxLength: 100,
                                  controller: controller.priceController,
                                  inputType: TextInputType.phone,
                                  textCapitalization: TextCapitalization.words,
                                ),
                              ),
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
                              Text(controller.contract!.endDate!),
                              // CustomTextFieldVerify(
                              //   maxLine: 1,
                              //   HintText: "124".tr,
                              //   maxLength: 100,
                              //   controller: controller.deadlineController,
                              //   prefixIcon: null,
                              //   inputType: TextInputType.datetime,
                              //   textCapitalization: TextCapitalization.words,
                              //   width: 180,
                              //   align: TextAlign.left,
                              //   height: 50,
                              // ),
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
                                        text:
                                            controller.contract!.task!.country,
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
                                          text: controller.contract!.task!.city,
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
                                    text: controller.contract!.task!.location,
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
                        Row(
                          children: [
                            Text(
                              '211'.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.pickImage(),
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Icon(Icons.add,
                                          size: 40, color: Colors.black45),
                                    ),
                                  ),
                                  ...controller.taskDonePictures.map(
                                    (image) => Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.file(
                                          File(image!.path),
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: CustomButton(
                            width: 250,
                            textcolor: 0xffffffff,
                            text: "212".tr,
                            backgroundColor: const Color(0xff6A3BA8),
                            onPressed: () {
                              controller.SendReceipt(
                                  context, controller.contract!.id!);
                            },
                            height: 50,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
