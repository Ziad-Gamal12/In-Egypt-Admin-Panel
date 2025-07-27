// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

ShowSnackBar({
  required BuildContext context,
  required Widget child,
  required Color backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: child,
    ),
  );
}

void showErrorSnackBar({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: MediaQuery.sizeOf(context).width * .5,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.red, width: 1.5),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyles(context).semiBold16.copyWith(color: Colors.white),
      ),
    ),
  );
}

void showWarningSnackBar({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      width: MediaQuery.sizeOf(context).width * .5,

      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.orange.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.orange, width: 1.5),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyles(context).semiBold16.copyWith(color: Colors.white),
      ),
    ),
  );
}

void showSuccessSnackBar({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: MediaQuery.sizeOf(context).width * .5,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.green, width: 1.5),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyles(context).semiBold16.copyWith(color: Colors.white),
      ),
    ),
  );
}
