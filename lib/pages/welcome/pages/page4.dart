import 'package:app/common/index.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage4 extends StatelessWidget {
  const WelcomePage4({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 16),
      Text("Connect with health practitioners and access patient resources",
          style: AppTextStyles.headline, textAlign: TextAlign.center),
      const SizedBox(height: Constants.defaultSpaceSize * 8),
      ExtendedImage.asset(AssetsImages.step4,
          width: double.infinity, fit: BoxFit.cover),
      mainElevatedButton(
          onPressed: () => Get.offNamed(RouteNames.getStarted), text: "START")
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2);
  }
}
