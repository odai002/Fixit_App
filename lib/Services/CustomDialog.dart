import 'package:flutter/material.dart';
import 'package:fixit/Constant/colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomDialog {
  static DialogSuccess(
    BuildContext context, {
    String? title,
  }) {
    showTopSnackBar(
      curve: Curves.fastLinearToSlowEaseIn,
      Overlay.of(context),
      CustomSnackBar.success(
        message: title!,
      ),
    );
  }

  static DialogError(
    BuildContext context, {
    String? title,
  }) {
    showTopSnackBar(
      curve: Curves.fastLinearToSlowEaseIn,
      Overlay.of(context),
      CustomSnackBar.error(
        message: title!,
      ),
    );
  }

  static DialogWarning(
    BuildContext context, {
    String? title,
  }) {
    showTopSnackBar(
      curve: Curves.fastLinearToSlowEaseIn,
      Overlay.of(context),
      CustomSnackBar.info(
        backgroundColor: AppColors.primary,
        message: title!,
      ),
    );
  }
}
