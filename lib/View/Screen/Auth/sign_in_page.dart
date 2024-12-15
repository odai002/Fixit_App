import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller/Auth/signin_controller.dart';
import '../../../Core/function/validate_input.dart';
import '../../Widgets/Custom_Button.dart';
import '../../Widgets/custom_textfield.dart';

class SignIn extends StatelessWidget {

   SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SigninControllerImp controller= Get.put(SigninControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body:Center(
        child:SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,

          ),
          child:   Container(
            width:  double.maxFinite,
            padding: const EdgeInsets.all(37.2),
            child: Form(
              key:controller.formstate8,
              child: Column  (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(

                                text:  "3".tr,
                                style: GoogleFonts.getFont('Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: const Color(0xff6A3BA8),
                                ),
                              ),
                            ]

                        ),

                      ),
                      const SizedBox(width: 5),
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(

                                text:  "4".tr,
                                style: GoogleFonts.getFont('Libre Caslon Text',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ]

                        ),

                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(

                          text:  "12".tr,
                          style: GoogleFonts.getFont('Libre Caslon Text',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 34),
                  Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                  ),
                    child: CustomTextField(
                      validator: (val){
                        return validinput(val!, 5, 50, "email");

                      },
                      maxLength: 100,
                      controller: controller.email,
                      name: "11".tr,
                      prefixIcon: Icons.email_rounded,
                      prefixIconColor:const Color(0xff6A3BA8),
                      inputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.words,
                      suffixIcon: null,
                    ),

                  ),
                  const SizedBox(height: 24),
                  Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                  ),
                    child: GetBuilder<SigninControllerImp>(
                      builder:(controller) => CustomTextField(
                        validator: (val){
                          return validinput(val!, 8, 30, "password");
                        },
                        maxLength: 100,

                        obscureText:controller.isshowpassword,
                        controller:controller.password ,
                        name: "10".tr,
                        prefixIcon: Icons.lock,
                        prefixIconColor:const Color(0xff6A3BA8),
                        inputType: TextInputType.visiblePassword,
                        textCapitalization: TextCapitalization.words,
                        suffixIcon: Icons.remove_red_eye,
                        onTapIcon:(){
                          controller.Showpassword();
                        },
                      ),
                    ),

                  ),
                  const SizedBox(height: 22),

                  Align(
                    alignment: Alignment.bottomRight, child:
                  Column(
                    children: [
                      Container(

                        padding: const EdgeInsets.only(bottom: 5),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide (
                                color: Color(0xff6A3BA8),
                                width: 1.5,
                              )
                          ),
                        ),

                        child:  InkWell(
                          onTap: (){
                            controller.ToPageForgetPassword();
                          },
                          child:  RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:  "9".tr,
                                  style: GoogleFonts.getFont('Libre Caslon Text',

                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: const Color(0xff6A3BA8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  ),
                  const SizedBox(height: 24),
                  GetBuilder<SigninControllerImp>(builder:(controller) =>
                      Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                      ),
                        child:   CustomButton(
                            height: 50, fontSize: 12,
                            width: 250,
                            textcolor: 0xffffffff,
                            text: '8'.tr,
                            backgroundColor: const Color(0xff6A3BA8),
                            onPressed:() {
                              controller.Signin();
                            }
                        ),
                      ),
                  ),
                  const SizedBox(height: 24),
                  Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                  ),
                    child:   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(

                                  text:  "6".tr,
                                  style: GoogleFonts.getFont('Libre Caslon Text',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: const Color(0xff7F7F7F),
                                  ),
                                ),
                              ]

                          ),

                        ),
                        const SizedBox(width: 5),
                        Container(

                          padding: const EdgeInsets.only(bottom: 2),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide (
                                  color: Color(0xff6A3BA8),
                                  width: 1.5,
                                )
                            ),
                          ),

                          child:  InkWell(
                            onTap: (){
                              controller.ToPageSignup();
                            },
                            child:  RichText(
                              textAlign: TextAlign.right,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:  "7".tr,
                                    style: GoogleFonts.getFont('Libre Caslon Text',

                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: const Color(0xff6A3BA8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
