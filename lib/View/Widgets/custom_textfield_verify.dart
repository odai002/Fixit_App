import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldVerify extends StatelessWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final int maxLength;
  final int? maxLine;
  final double width;
  final double height;
  final String HintText;
 final TextAlign align;
  const CustomTextFieldVerify({
    Key? key,
    required this.align,
    required this.controller,
     required this.prefixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
    required this.maxLength,
    required this.maxLine,
    required this.width,
    required this.height,
    required this.HintText,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      //elevation will add drop shadow
      elevation: 8,
      //This is the shadow color
      shadowColor: Colors.black,
       borderRadius: BorderRadius.all(Radius.circular(11)),

      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),

              child: TextField(
                keyboardType: TextInputType.multiline,
                enabled: true,
                controller: controller,
                textCapitalization: textCapitalization,
                maxLength: maxLength,
                maxLines: maxLine,
                obscureText: obscureText,
                textAlign: align,
                style: const TextStyle(

                  color: Colors.black,
                  fontSize: 12,
                ),

                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: HintText,
                  isDense: true,
                  counterText: "",
                  labelStyle: const TextStyle(
                      fontSize: 10,
                      color: Colors.black),
                  suffixStyle: GoogleFonts.getFont('Libre Caslon Text', fontWeight: FontWeight.w400,
                  ),

                ),
              ),
            ),
      ),
    );
  }
}