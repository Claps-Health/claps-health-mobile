import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class FeedbackPage extends GetView<FeedbackController> {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Feedback',
    )).gradientBody();
  }
}
