import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GrayTopic extends StatelessWidget {
  const GrayTopic({super.key, required this.topicName});

  final String topicName;

  @override
  Widget build(BuildContext context) {
    return Text(topicName, style: AppTextStyles.buttonText)
        .center()
        .marginSymmetric(vertical: Constants.defaultSpaceSize)
        .decorated(
          color: const Color(0xFF808080),
          borderRadius: BorderRadius.circular(8),
        );
  }
}
