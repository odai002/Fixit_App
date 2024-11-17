import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final IconData prefixIcon;
  final Color prefixIconColor; // New parameter for prefix icon color
  final IconData? suffixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final int maxLength;
  final String? Function(String?)? validator;
  final void Function()? onTapIcon;

  const CustomTextField({
    Key? key,
    required this.validator,
    required this.controller,
    required this.name,
    required this.prefixIcon,
    required this.prefixIconColor, // New parameter added here
    this.suffixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
    required this.maxLength,
    this.onTapIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(11)),
      child: TextFormField(
        validator: validator,
        enabled: true,
        controller: controller,
        textCapitalization: textCapitalization,
        maxLength: maxLength,
        maxLines: 1,
        obscureText: obscureText,
        keyboardType: inputType,
        textAlign: TextAlign.start,
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
          prefixIcon: Icon(prefixIcon, color: prefixIconColor), // Use the custom color here
          suffixIcon: InkWell(onTap: onTapIcon, child: Icon(suffixIcon)),
          isDense: true,
          labelText: name,
          counterText: "",
          labelStyle: const TextStyle(
            fontSize: 13.5,
            color: Colors.grey,
          ),
          suffixStyle: GoogleFonts.getFont('Libre Caslon Text', fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
