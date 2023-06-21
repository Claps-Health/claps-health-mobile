import 'package:app/common/index.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage2 extends StatelessWidget {
  const WelcomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 16),
      Text("Track your daily health activities",
          style: AppTextStyles.headline, textAlign: TextAlign.center),
      const SizedBox(height: Constants.defaultSpaceSize * 10),
      ExtendedImage.asset(AssetsImages.step2,
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
