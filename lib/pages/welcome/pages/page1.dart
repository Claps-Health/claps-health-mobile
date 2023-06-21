import 'package:app/common/index.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage1 extends StatelessWidget {
  const WelcomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 16),
      Text("Welcome to Claps Health!",
          style: AppTextStyles.headline, textAlign: TextAlign.center),
      const SizedBox(height: Constants.defaultSpaceSize * 7),
      Text(
          "Revolutionize Your Health Journey, the Fun Way to a Better Lifestyle!",
          style: AppTextStyles.subTitle),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      ExtendedImage.asset(AssetsImages.step1,
          width: double.infinity, fit: BoxFit.cover),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2);
  }
}
