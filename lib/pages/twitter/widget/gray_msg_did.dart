import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GrayMsgDID extends StatelessWidget {
  const GrayMsgDID({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(content, style: AppTextStyles.grayMediumText)
        .marginAll(Constants.defaultSpaceSize * 2)
        .decorated(
          color: const Color(0xFFd9d9d9),
          borderRadius: BorderRadius.circular(8),
        )
        .constrained(minWidth: double.infinity, minHeight: 150);
  }
}
