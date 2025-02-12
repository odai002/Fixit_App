import 'dart:io';

import 'package:fixit/Constant/Lists.dart';
import 'package:fixit/Constant/text_styles.dart';
import 'package:fixit/Core/function/validate_input.dart';
import 'package:fixit/View/HomeOwner/TaskPage/Controller/TaskPageController.dart';
import 'package:fixit/View/Widgets/Custom_Button.dart';
import 'package:fixit/View/Widgets/Custom_DropdownMenu.dart';
import 'package:fixit/View/Widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            "21".tr,
            style: TextStyles.title,
          ),
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Consumer<TaskPageController>(
        builder: (context, controller, child) => Form(
          key: controller.formstate88,
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.all(32.2),
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "22".tr,
                          style: GoogleFonts.getFont(
                            'Libre Caslon Text',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomTextField(
                      isrequierd: true,
                      name: '23'.tr,
                      maxLength: 100,
                      controller: controller.titleController,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "24".tr,
                            style: GoogleFonts.getFont(
                              'Libre Caslon Text',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    isrequierd: true,
                    name: '25'.tr,
                    maxLength: 400,
                    controller: controller.describeController,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                  ),
                ],
              ),
              const SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownMenuExample(
                    items: Countries,
                    onSelected: (String value) {
                      controller.selectCountry(value);
                    },
                    initialValue: controller.selectedCountry,

                    // initialValue: (String value) {
                    //   controller.selectedCountry;
                    // },
                  ),
                  const SizedBox(width: 22),
                  DropdownMenuExample(
                    items: Cities,
                    onSelected: (String value) {
                      controller.selectCity(value);
                    },
                    initialValue: controller.selectedCity,

                    // initialValue: (String valuee) {
                    //   controller.selectedCity;
                    // },
                  ),
                ],
              ),
              const SizedBox(height: 33),
              CustomTextField(
                validator: (value) {
                  return validinput(value!, 5, 100, "street");
                },
                maxLength: 100,
                obscureText: false,
                controller: controller.locationController,
                name: "27".tr,
                icon: Icon(Icons.streetview_rounded),
                inputType: TextInputType.name,
                // prefixIconColor: const Color(0xff6A3BA8),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 33),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "28".tr,
                        style: GoogleFonts.getFont(
                          'Libre Caslon Text',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: controller.pickImage,
                      child: Image.asset(
                        'assets/Union.png',
                        width: 80,
                      ),
                    ),
                    const SizedBox(width: 12),
                    ...controller.selectedimage.map(
                      (image) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Image.file(
                          File(image.path),
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              CustomButton(
                width: 250,
                textcolor: 0xffffffff,
                text: '29'.tr,
                backgroundColor: const Color(0xff6A3BA8),
                onPressed: () async {
                  if (controller.formstate88.currentState!.validate()) {
                    controller.SendTask(context);
                  }
                },
                height: 50,
                fontSize: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
