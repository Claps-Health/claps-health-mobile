import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showPainChooseDialog(Widget dialogContent) {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      // elevation: 0,
      insetPadding: EdgeInsets.zero,
      child: dialogContent.transparentDialogBackground(),
    ).marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
    barrierColor: Colors.transparent,
    barrierDismissible: true,
  );
}

extension DialogBackground on Widget {
  Widget transparentDialogBackground() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Color(0xCCFFFFFF), //transparent: 80%, white
      ),
      child: this,
    );
  }
}
