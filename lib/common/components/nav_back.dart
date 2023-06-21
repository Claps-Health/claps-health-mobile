import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBack extends StatelessWidget {
  const NavBack({super.key, this.iconSize = 36});
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.arrow_back_ios_new,
            color: const Color(0xFF898989), size: iconSize)
        .onTap(Get.back);
  }
}
