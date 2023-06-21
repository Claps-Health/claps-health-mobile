import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget mainElevatedButton({
  required VoidCallback? onPressed,
  required String text,
  BorderRadius? borderRadius,
  MaterialTapTargetSize? tapTargetSize,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF456d93),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      tapTargetSize: tapTargetSize,
    ),
    child: Text(text, style: AppTextStyles.buttonText)
        .marginSymmetric(vertical: Constants.defaultSpaceSize),
  ).width(double.infinity);
}
