import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMessagePopup({
  required String upperText,
  required String contentText,
  required String btnTxt,
  required VoidCallback onPressed,
}) {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: <Widget>[
        const SizedBox(height: Constants.defaultSpaceSize * 3),
        Text(upperText, style: AppTextStyles.redInputTitle).center(),
        const SizedBox(height: Constants.defaultSpaceSize * 2),
        Text(contentText, style: AppTextStyles.mediumBkText)
            .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
        const SizedBox(height: Constants.defaultSpaceSize * 2),
        mainElevatedButton(onPressed: onPressed, text: btnTxt)
            .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
        const SizedBox(height: Constants.defaultSpaceSize * 2),
      ]
          .toColumn(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min)
          .scrollable(),
    ).marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
  );
}
