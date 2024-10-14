import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final int maxLength;
  final String? Function(String?)? validator;
  final void Function()? onTapIcon;
  // final String? Function(String?)? validator;
  const CustomTextField({
    Key? key,
    required this.validator,
    required this.controller,
    required this.name,
    required this.prefixIcon,
    required this.suffixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
    required this.maxLength, this.onTapIcon,

    // required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      //elevation will add drop shadow
      elevation: 8,
      //This is the shadow color
      shadowColor: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(11)),

      child: TextFormField(
        validator: validator,
        enabled: true,
        controller: controller,
        textCapitalization: textCapitalization,
        maxLength: maxLength,
        maxLines: 1,
        obscureText: obscureText == null  || obscureText == false ? false : true,
        keyboardType: inputType,
        textAlign: TextAlign.start,
        // validator: validator,
        style: const TextStyle(

          color: Colors.black,
          fontSize: 12,
        ),

        decoration: InputDecoration(

          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: InkWell(onTap:onTapIcon,child: Icon(suffixIcon),),
          isDense: true,
          labelText: name,
          counterText: "",
          labelStyle: const TextStyle(
              fontSize: 10,
              color: Colors.grey),
          suffixStyle: GoogleFonts.getFont('Libre Caslon Text', fontWeight: FontWeight.w400,
          ),

        ),
      ),
    );
  }
}