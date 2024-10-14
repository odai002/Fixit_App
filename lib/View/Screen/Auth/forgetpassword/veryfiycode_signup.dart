import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Controller/Auth/veryfiey_signup_controller.dart';


class VerifyCodeSignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    VeryfiycodeSignupControllerImp controller =Get.put(VeryfiycodeSignupControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child:SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,

          ),
          child:   Container(
            width:  double.maxFinite,
            padding: EdgeInsets.all(37.2),
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

                              text:  "Verify",
                              style: GoogleFonts.getFont('Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Color(0xff6A3BA8),
                              ),
                            ),
                          ]

                      ),

                    ),
                    SizedBox(width: 5),
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(

                              text:  "Code",
                              style: GoogleFonts.getFont('Libre Caslon Text',
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Color(0xff000000),
                              ),
                            ),
                          ]

                      ),

                    ),
                  ],
                ),
                SizedBox(height: 26),
                RichText(

                  text: TextSpan(
                    children: [
                      TextSpan(

                        text:  "Please enter the code we just send to the  ",
                        style: GoogleFonts.getFont('Libre Caslon Text',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xff000000),
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 34),
                const Padding(padding:   EdgeInsets.symmetric(horizontal:  1
                ),

                ),
                OtpTextField(
                  borderRadius:BorderRadius.circular(10),
                  numberOfFields: 5,
                  fieldWidth:45,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                    controller.ToPageSucsessSignUp();

                  }, // end onSubmit
                ),

              ],

            ),
          ),

        ),
      ),
    );


  }
}




