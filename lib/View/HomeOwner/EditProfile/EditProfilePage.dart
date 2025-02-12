// ignore_for_file: avoid_types_as_parameter_names

import 'package:fixit/Constant/Lists.dart';
import 'package:fixit/Constant/text_styles.dart';
import 'package:fixit/Services/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/EditProfileController.dart';
import '../../../Core/function/validate_input.dart';
import '../../Widgets/Custom_Button.dart';
import '../../Widgets/Custom_DropdownMenu.dart';
import '../../Widgets/custom_textfield.dart';

class EditAccountPage extends StatelessWidget {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    EditaccountController controller = Get.put(EditaccountController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '101'.tr,
          style: TextStyles.title,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            CustomRoute.RoutePop(context);
            Get.delete<EditaccountController>();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.FormState0,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      // prefixIconColor: const Color(0xff6A3BA8),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextField(
                      validator: (val) {
                        return validinput(val!, 10, 25, "phone");
                      },
                      maxLength: 100,
                      controller: controller.phone,
                      name: "103".tr,
                      icon: Icon(Icons.phone_android_rounded),
                      // prefixIconColor: const Color(0xff6A3BA8),
                      inputType: TextInputType.phone,
                      textCapitalization: TextCapitalization.words,
                      // suffixIcon: null,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GetBuilder<EditaccountController>(
                      builder: (controller) => Row(
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
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextField(
                      validator: (val) {
                        return validinput(val!, 5, 100, "street");
                      },
                      maxLength: 100,
                      controller: controller.streetAddress,
                      // prefixIconColor: const Color(0xff6A3BA8),
                      name: "104".tr,
                      icon: Icon(Icons.streetview_rounded),
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      // suffixIcon: null,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GetBuilder<EditaccountController>(
                      builder: (controller) => CustomTextField(
                        validator: (val) {
                          return null;

                          // return validinput(val!, 8, 30, "password");
                        },
                        maxLength: 100,
                        obscureText: controller.isshowpassword,
                        controller: controller.old_password,
                        name: "190".tr,
                        icon: Icon(Icons.lock),
                        // prefixIconColor: const Color(0xff6A3BA8),
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        // suffixIcon: Icons.remove_red_eye,
                        ispassword: true,
                        // onTapIcon: () {
                        //   controller.ShowPassword();
                        // },
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GetBuilder<EditaccountController>(
                      builder: (controller) => CustomTextField(
                        validator: (val) {
                          if (controller.old_password.text.isNotEmpty) {
                            return validinput(val!, 8, 30, "password");
                          }
                          return null;
                        },
                        maxLength: 100,
                        obscureText: controller.isshowpassword,
                        controller: controller.password,
                        name: "191".tr,
                        icon: Icon(Icons.lock),
                        // prefixIconColor: const Color(0xff6A3BA8),
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        // suffixIcon: Icons.remove_red_eye,
                        ispassword: true,
                        // onTapIcon: () {
                        //   controller.ShowPassword();
                        // },
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  GetBuilder<EditaccountController>(
                    builder: (controller) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextField(
                        validator: (val) {
                          if (controller.old_password.text.isNotEmpty) {
                            if (val != controller.password.text) {
                              return "password do not match";
                            } else {
                              return validinput(val!, 8, 30, "confirmPassword");
                            }
                          }
                          return null;
                        },
                        maxLength: 100,
                        obscureText: controller.isConfirmshowpassword,
                        // prefixIconColor: const Color(0xff6A3BA8),
                        controller: controller.password_confirmation,
                        name: "105".tr,
                        icon: Icon(Icons.lock),
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        ispassword: true,
                        // suffixIcon: Icons.remove_red_eye,
                        // onTapIcon: () {
                        //   controller.ShowConfirmPassword();
                        // },
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  GetBuilder<EditaccountController>(
                    builder: (controller) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetBuilder<EditaccountController>(
                            builder: (controller) => CustomButton(
                              fontSize: 12,
                              height: 50,
                              textcolor: 0xffFFFFFF,
                              text: '106'.tr,
                              backgroundColor: const Color(0xff6A3BA8),
                              width: 120,
                              onPressed: () async {
                                await controller.Edit();
                              },
                            ),
                          ),
                          const SizedBox(width: 22),
                          CustomButton(
                            fontSize: 12,
                            height: 50,
                            textcolor: 0xff6A3BA8,
                            width: 120,
                            text: '107'.tr,
                            backgroundColor: const Color(0xffFFFFFF),
                            onPressed: () {
                              CustomRoute.RoutePop(context);
                              Get.delete<EditaccountController>();
                            },
                          ),
                        ],
                      ),
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
