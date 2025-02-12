// ignore_for_file: use_super_parameters, avoid_types_as_parameter_names, avoid_print

import 'package:fixit/Constant/Lists.dart';
import 'package:fixit/View/Auth/SignUp/Controller/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Core/function/validate_input.dart';
import '../../Widgets/Custom_Button.dart';
import '../../Widgets/Custom_DropdownMenu.dart';
import '../../Widgets/custom_textfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpController>(
      builder: (context, controller, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(37.2),
              child: Form(
                key: controller.formstate59,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "110".tr,
                                style: GoogleFonts.getFont(
                                  'Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: const Color(0xff6A3BA8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "111".tr,
                                style: GoogleFonts.getFont(
                                  'Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "112".tr,
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
                    const SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: CustomTextField(
                        validator: (val) {
                          return validinput(val!, 2, 35, "username");
                        },
                        maxLength: 100,
                        controller: controller.username,
                        name: "102".tr,
                        icon: Icon(Icons.person_rounded),
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: CustomTextField(
                        validator: (val) {
                          return validinput(val!, 4, 100, "email");
                        },
                        maxLength: 100,
                        controller: controller.email,
                        name: "11".tr,
                        icon: Icon(Icons.email_rounded),
                        inputType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.words,
                        // suffixIcon: null,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: CustomTextField(
                        validator: (val) {
                          return validinput(val!, 10, 25, "phone");
                        },
                        maxLength: 100,
                        controller: controller.phone,
                        name: "103".tr,
                        icon: Icon(Icons.phone_android_rounded),
                        inputType: TextInputType.phone,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: [
                          DropdownMenuExample(
                            items: ['homeowner', 'contractor'],
                            onSelected: (String value) {
                              controller.setUsertype(value);
                            },
                            initialValue: controller.role,
                          ),
                          const SizedBox(height: 22),
                          if (controller.showContractorDropdown)
                            DropdownMenuExample(
                              items: services
                                  .map((service) => service['name'] as String)
                                  .toList(),
                              onSelected: (String selectedServiceName) {
                                controller.setService(selectedServiceName);
                              },
                              initialValue: controller.selectedService,

                              // initialValue: (String) {
                              //   controller.selectedService;
                              // },
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        DropdownMenuExample(
                          items: Countries,
                          onSelected: (String value) {
                            controller.setCountry(value);
                          },
                          initialValue: controller.country,
                        ),
                        const SizedBox(width: 22),
                        DropdownMenuExample(
                          items: Cities,
                          onSelected: (String value) {
                            controller.setCity(value);
                          },
                          initialValue: controller.city,
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: CustomTextField(
                        validator: (val) {
                          return validinput(val!, 5, 100, "street");
                        },
                        maxLength: 100,
                        controller: controller.address,
                        name: "104".tr,
                        icon: Icon(Icons.streetview_rounded),
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: CustomTextField(
                        validator: (val) {
                          return validinput(val!, 8, 30, "password");
                        },
                        maxLength: 100,
                        obscureText: controller.isshowpassword,
                        controller: controller.password,
                        name: "10".tr,
                        icon: Icon(Icons.lock),
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        ispassword: true,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: CustomTextField(
                        validator: (val) {
                          if (val != controller.password.text) {
                            return "password do not match";
                          } else {
                            return validinput(val!, 8, 30, "confirmPassword");
                          }
                        },
                        maxLength: 100,
                        controller: controller.password_confirmation,
                        name: "105".tr,
                        icon: Icon(Icons.lock),
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        // suffixIcon: Icons.remove_red_eye,
                        ispassword: true,
                        // onTapIcon: () {
                        //   controller.ShowConfirmPassword();
                        // },
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                              fontSize: 12,
                              height: 50,
                              textcolor: 0xffFFFFFF,
                              text: '113'.tr,
                              backgroundColor: const Color(0xff6A3BA8),
                              width: 120,
                              onPressed: () async {
                                if (controller.formstate59.currentState!
                                    .validate()) {
                                  try {
                                    controller.SignUp(context);
                                  } catch (e) {
                                    print(
                                        "Error occurred during registration: $e");
                                    Get.snackbar("Error",
                                        "Registration failed. Please try again.");
                                  }
                                }
                                // await controller.Register();
                              }),
                          const SizedBox(width: 22),
                          CustomButton(
                            fontSize: 12,
                            height: 50,
                            textcolor: 0xff6A3BA8,
                            width: 120,
                            text: '107'.tr,
                            backgroundColor: const Color(0xffFFFFFF),
                            onPressed: () {
                              controller.Cancel(context);
                            },
                          ),
                        ],
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
