

import 'package:fixit/Controller/HomeOnwer/taskpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../Core/function/validate_input.dart';
import '../../../../Widgets/Custom_Button.dart';
import '../../../../Widgets/Custom_DropdownMenu.dart';
import '../../../../Widgets/custom_textfield.dart';
import '../../../../Widgets/custom_textfield_verify.dart';



class Taskpage extends StatelessWidget {
  TaskpageControllerImp controller = Get.put(TaskpageControllerImp());
  final contractor_id = Get.arguments['id'] ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Task Creation",
                  style: GoogleFonts.getFont('Libre Caslon Text',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
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
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(32.2),
            child: Form(
              key:controller.formstate88,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Task Title:",
                              style: GoogleFonts.getFont('Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      CustomTextFieldVerify(
                        maxLine: 1,
                        HintText: 'Type Title...',
                        maxLength: 100,
                        controller: controller.titleController,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        width: 220,
                        align: TextAlign.left,
                        height: 50, prefixIcon: null,
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
                                text: "Task Description : ",
                                style: GoogleFonts.getFont('Libre Caslon Text',
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
                      CustomTextFieldVerify(
                        maxLine: 20,
                        HintText: 'Describe your task here...',
                        maxLength: 400,
                        controller: controller.describeController,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        width: 300,
                        align: TextAlign.left,
                        height: 200, prefixIcon: null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 33),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownMenuExample(
                        items: controller.Country,
                        onSelected: (String value) {
                          controller.selectCountry(value);
                        },
                        initialValue:(String value){ controller.selectedCountry;},
                      ),
                      const SizedBox(width: 22),
                      DropdownMenuExample(
                        items: controller.City,
                        onSelected: (String value) {
                          controller.selectCity(value);
                        },
                        initialValue:(String valuee) {controller.selectedCity;},
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
                    name: "Type the Location of your task..",
                    prefixIcon: Icons.streetview_rounded,
                    inputType: TextInputType.name,
                    prefixIconColor: const Color(0xff6A3BA8),
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBox(height: 33),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Task Picture: ",
                            style: GoogleFonts.getFont('Libre Caslon Text',
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
                  GetBuilder<TaskpageControllerImp>(
                    builder: (controller) {
                      return SingleChildScrollView(
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
                                  image,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ).toList(),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    width: 250,
                    textcolor: 0xffffffff,
                    text: 'Send Task',
                    backgroundColor: const Color(0xff6A3BA8),
                    onPressed: () async{
                      controller.submitTask(contractor_id);
                    },
                    height: 50,
                    fontSize: 12,
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
