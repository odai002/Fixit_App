import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Controller/Auth/resetpassword_controller.dart';
import '../../../../Core/function/validate_input.dart';
import '../../../Widgets/Custom_Button.dart';
import '../../../Widgets/custom_textfield.dart';

class Resetpassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ResetpasswordControllerImp controller = Get.put(ResetpasswordControllerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child:SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,

          ),
          child:   Padding(
            padding: const EdgeInsets.all(37.2),
            child: Form(
              key:controller.formstate,
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

                                text:  "Change",
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

                                text:  "Password",
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

                          text:  "use your registered email ",
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
                    child: GetBuilder<ResetpasswordControllerImp>(builder:(controller) => CustomTextField(
                        validator: (val){
                          return validinput(val!, 8, 30, "password");
                          },
                        maxLength: 100,
                        controller: controller.password,
                        name: "new password...",
                        prefixIcon: Icons.lock,
                        inputType: TextInputType.name,
                        obscureText:controller.isshowpassword,
                        onTapIcon:(){
                          controller.ShowPassword();
                        },
                        textCapitalization: TextCapitalization.words, suffixIcon: Icons.remove_red_eye,
                      ),
                    ),

                  ),
                  const SizedBox(height: 24),
                  Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                  ),
                    child: GetBuilder<ResetpasswordControllerImp>(builder:(controller) => CustomTextField(
                          validator: (val){
                            if(val != controller.password.text){
                            return "password do not match" ;
                            }else {
                              return validinput(val!, 8, 30, "password");
                            }},
                        maxLength: 100,
                        controller: controller.Confirmpassword,
                        name: "confirm password...",
                        prefixIcon: Icons.lock,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                          suffixIcon: Icons.remove_red_eye,
                        obscureText:controller.isConfirmshowpassword,
                        onTapIcon:(){
                            controller.ShowConfirmPassword();
                        },
                      ),
                    ),

                  ),
                  const SizedBox(height: 44),
                  Padding(padding: const EdgeInsets.symmetric(horizontal:  1
                  ),
                    child:   CustomButton(
                      fontSize: 12,
                      height: 50,
                      width: 250,
                      textcolor: 0xffffffff,
                      text: 'Save',
                      backgroundColor: const Color(0xff6A3BA8),
                      onPressed: () {
                        controller.ToPageSucsessResset();

                        }
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
