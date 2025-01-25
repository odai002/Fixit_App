// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:fixit/Constant/colors.dart';
import 'package:fixit/Constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  Icon? icon;
  TextInputType? type;
  bool isrequierd = false;
  String? hint;
  bool? ispassword;
  int? line;
  String? Function(String?)? validator;
  bool enable;
  TextEditingController? controller;
  final String name;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final int maxLength;
  final void Function()? onTapIcon;

  CustomTextField({
    Key? key,
    this.icon,
    this.type,
    this.controller,
    this.hint,
    this.isrequierd = false,
    this.validator,
    this.ispassword = false,
    this.enable = true,
    this.line = 1,
    required this.name,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
    required this.maxLength,
    this.onTapIcon,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool? visiblepassword = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(11)),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        validator: widget.validator ??
            (value) {
              if (widget.isrequierd) {
                if (value!.isEmpty || value == '') {
                  return widget.isrequierd ? "This field is required" : '';
                }
                return null;
              } else {
                return null;
              }
            },
        maxLines: widget.line,
        keyboardType: widget.type,
        style: TextStyles.inputtitle,
        obscureText: widget.ispassword! ? visiblepassword! : false,
        onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
        cursorColor: AppColors.active,
        enabled: true,
        textCapitalization: widget.textCapitalization,
        maxLength: widget.maxLength,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: widget.enable ? AppColors.basic : AppColors.grey50,
          prefixIcon: widget.icon,
          suffixIcon: widget.ispassword!
              ? visiblepassword!
                  ? GestureDetector(
                      onTap: () => setState(() {
                        visiblepassword = !visiblepassword!;
                      }),
                      child: Icon(
                        Icons.visibility_off_rounded,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    )
                  : GestureDetector(
                      onTap: () => setState(() {
                        visiblepassword = !visiblepassword!;
                      }),
                      child: Icon(
                        Icons.visibility,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    )
              : null,
          enabled: widget.enable,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: AppColors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide.none),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide.none),
          isDense: true,
          labelText: widget.name,
          counterText: "",
          labelStyle: const TextStyle(
            fontSize: 13.5,
            color: Colors.grey,
          ),
          suffixStyle: GoogleFonts.getFont('Libre Caslon Text',
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
