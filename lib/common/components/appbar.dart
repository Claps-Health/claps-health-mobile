import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar mainAppBarWidget({required String titleString}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: Get.back,
    ),
    centerTitle: true,
    title: Text(titleString),
  );
}
