import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MnemonicWhiteBox extends StatelessWidget {
  const MnemonicWhiteBox({super.key, required this.mnemonicText});

  final String mnemonicText;

  @override
  Widget build(BuildContext context) {
    return Text(
      mnemonicText,
      style: AppTextStyles.mediumHeavyText,
    )
        .marginAll(Constants.defaultSpaceSize * 2)
        .decorated(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        )
        .constrained(minWidth: double.infinity, minHeight: 80);
  }
}
