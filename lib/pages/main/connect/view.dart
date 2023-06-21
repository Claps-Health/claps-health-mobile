import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ConnectPage extends GetView<ConnectController> {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Connect',
    )).gradientBody();
  }
}
