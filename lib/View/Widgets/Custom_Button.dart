
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double fontSize;
  final double height;
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double width;
  final int textcolor;
  const CustomButton({
    Key? key,
    required this.text,
    this.backgroundColor = Colors.red,
    required this.onPressed,
    required this.width,
    required this.textcolor,
    required this.height,
    required this.fontSize,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff6A3BA8),),

            color: backgroundColor,
            borderRadius: BorderRadius.circular(11),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 0.5,
                  spreadRadius: 0.5,
                  offset: Offset.fromDirection(90))
            ]),
        width: width,
        height: height,
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical:14),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont('Libre Caslon Text',

            fontWeight: FontWeight.w500,
            fontSize: fontSize,
            color: Color(textcolor),
          ),
        ),
      ),
    );
  }
}