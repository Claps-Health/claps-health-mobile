import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget mainCheckboxText(
    {required String text,
    required bool checkedValue,
    required void Function(bool?)? onChanged}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: 16,
        height: 16,
        child: ColoredBox(
          color: Colors.white,
          child: Checkbox(
            value: checkedValue,
            onChanged: onChanged,
            checkColor: const Color(0xFF456d93),
            activeColor: Colors.white,
            side: const BorderSide(width: 2, color: Colors.white),
          ),
        ),
      ).marginOnly(right: Constants.defaultSpaceSize),
      Text(text, style: AppTextStyles.normalSmallText).expanded(),
    ],
  );
}
