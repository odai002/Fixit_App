// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screen/Home_Owner/Input_onwer/Home_app/search_page.dart';

class CustomSearchfield extends StatelessWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final int maxLength;
  final String hintText;

  const CustomSearchfield({
    super.key,
    required this.controller,
     required this.prefixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
    required this.maxLength,
    required this.hintText,

  });

  @override
  Widget build(BuildContext context) {
    return Material(
      //elevation will add drop shadow
      elevation: 8,
      //This is the shadow color
      shadowColor: Colors.black,
       borderRadius: const BorderRadius.all(Radius.circular(8)),

      child: Center(
        child: SizedBox(
          height: 40,
          child: TextField(

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
              contentPadding: const EdgeInsets.only(left: 14),
              alignLabelWithHint: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hintText,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 7),
                child: Material
                  (
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8),topLeft: Radius.circular(8),),
                   color: const Color(0xff9B6CD7),
                    child: InkWell(
                      borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                    onTap: () {
                      /*/Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage(data: controller.text,)),
                      );
                      ),*/
                    },
                      child:  const Icon(Icons.search,
                      color: Colors.white,
                      size: 21,)
                      ),
                  ),
              ),
              isDense: true,
              counterText: "",
              labelStyle: const TextStyle(

                  fontSize: 10,
                  color: Colors.grey),
              suffixStyle: GoogleFonts.getFont('Libre Caslon Text', fontWeight: FontWeight.w400,
              ),

            ),

          ),
        ),
      ),
    );
  }
}