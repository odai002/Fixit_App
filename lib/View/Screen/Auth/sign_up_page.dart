import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller/Auth/signup_controller.dart';
import '../../../Core/function/validate_input.dart';
import '../../Widgets/Custom_Button.dart';
import '../../Widgets/Custom_DropdownMenu.dart';
import '../../Widgets/custom_textfield.dart';


class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupControllerImp controller =Get.put(SignupControllerImp());
    return Scaffold(
    resizeToAvoidBottomInset: false,
          body:Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(37.2),
                  child: Form(
                    key: controller.formstate,
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
                                    text: "Create",
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
                                    text: "account",
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
                                text: "Please Fill your information below ",
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
                            validator: (val){
                              return validinput(val!, 2, 35, "username");

                            },
                            maxLength: 100,
                            controller: controller.username,
                            name: "username...",
                            prefixIcon: Icons.person_rounded,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            suffixIcon: null,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: CustomTextField(
                            validator: (val){
                              return validinput(val!, 4, 100, "email");

                            },                      maxLength: 100,
                            controller: controller.email,
                            name: "Email...",
                            prefixIcon: Icons.email_rounded,
                            inputType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.words,
                            suffixIcon: null,
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
                            name: "phone...",
                            prefixIcon: Icons.phone_android_rounded,
                            inputType: TextInputType.phone,
                            textCapitalization: TextCapitalization.words,
                            suffixIcon: null,
                          ),
                        ),
                        const SizedBox(height: 22),

                        Align(
                          alignment:Alignment.bottomLeft,
                          child: GetBuilder<SignupControllerImp>(
                            builder: (controller) => Column(
                              children: [
                                DropdownMenuExample(
                                  items: const ['Home Owner', 'Contractor'],
                                  onSelected: (String value) {
                                    controller.setUsertype(value);
                                  },
                                ),
                                const SizedBox(height: 22),
                          
                                if (controller.showContractorDropdown)
                                  DropdownMenuExample(
                                    items: const [
                                      'Cleaning', 'Handyman', 'Movers', 'Landscaping', 'HVAC',
                                      'Plumbing', 'Snow Removal', 'Electrician', 'Roof Repair',
                                      'Carpet Cleaning', 'Flooring', 'Carpenter'
                                    ],
                                    onSelected: (String value) {
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                              const SizedBox(height: 22),

                        GetBuilder<SignupControllerImp>(
                          builder: (controller) => Row(
                            children: [
                              DropdownMenuExample(
                                items: const ['Syria', 'Jordan', 'Qatar'],
                                onSelected: (String value) {
                                  controller.setCountry(value);
                                },
                              ),
                              const SizedBox(width: 22),
                              DropdownMenuExample(
                                items: const ['Damascus', 'Aleppo', 'Homs', 'Amman', 'Doha'],
                                onSelected: (String value) {
                                  controller.setCity(value);
                                },
                              ),
                            ],
                          ),
                        ),

                              const SizedBox(height: 22),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: CustomTextField(
                            validator: (val) {
                              return validinput(val!, 5, 100, "street");

                            },
                            maxLength: 100,
                            controller: controller.streetAddress,
                            name: "type your street address...",
                            prefixIcon: Icons.streetview_rounded,
                            inputType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            suffixIcon: null,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: GetBuilder<SignupControllerImp>(builder:(controller) => CustomTextField(
                              validator: (val){
                                return validinput(val!, 8, 30, "password");
                                                            },
                              maxLength: 100,
                              obscureText: controller.isshowpassword,
                              controller: controller.password,
                              name: "password...",
                              prefixIcon: Icons.lock,
                              inputType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              suffixIcon: Icons.remove_red_eye,
                              onTapIcon:(){
                                controller.ShowPassword();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        GetBuilder<SignupControllerImp>(
                          builder:(controller) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: CustomTextField(
                              validator: (val){
                                if(val != controller.password.text){
                                  return "password do not match";
                                }else{
                                 return validinput(val!, 8, 30, "confirmPassword");
                              }
                                },
                              maxLength: 100,
                              obscureText: controller.isConfirmshowpassword,
                              controller: controller.confirmPassword,
                              name: "confirm password...",
                              prefixIcon: Icons.lock,
                              inputType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              suffixIcon: Icons.remove_red_eye,
                              onTapIcon:(){
                                controller.ShowConfirmPassword();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                    GetBuilder<SignupControllerImp>(
                      builder:(controller) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  fontSize: 12,
                                  height: 50,
                                  textcolor: 0xffFFFFFF,
                                  text: 'Register',
                                  backgroundColor: const Color(0xff6A3BA8),
                                  width: 120,
                                  onPressed: () {
                                    controller.Register();
                                  }
                                ),
                                const SizedBox(width: 22),
                                CustomButton(
                                  fontSize: 12,
                                  height: 50,
                                  textcolor: 0xff6A3BA8,
                                  width: 120,
                                  text: 'Cancel',
                                  backgroundColor: const Color(0xffFFFFFF),
                                  onPressed: () {
                                    controller.Cancel();
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
