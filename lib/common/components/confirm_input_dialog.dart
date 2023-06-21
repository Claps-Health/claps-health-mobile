import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showConfirmInputDialog({
  required String upperText,
  required String contentText,
  required TextEditingController inputEditingController,
  required bool isInputObscure,
  required VoidCallback confirmCallback,
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
        Text(upperText, style: AppTextStyles.redInputTitle)
            .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
        const SizedBox(height: Constants.defaultSpaceSize * 2),
        Text(contentText, style: AppTextStyles.mediumBkText)
            .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
        const SizedBox(height: Constants.defaultSpaceSize * 2),
        grayInputBox(
          textEditingController: inputEditingController,
          isObscureText: isInputObscure,
        ).marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
        const SizedBox(height: Constants.defaultSpaceSize * 5),
        <Widget>[
          mainElevatedButton(
            onPressed: () => Get.back(),
            text: "Cancel",
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(8)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ).height(50).expanded(),
          const SizedBox(width: Constants.defaultSpaceSize * 0.5),
          mainElevatedButton(
            onPressed: () {
              Get.back();
              confirmCallback();
            },
            text: "Confirm",
            borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(8)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ).height(50).expanded(),
        ].toRow(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max),
      ].toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min),
    ).marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
  );
}
