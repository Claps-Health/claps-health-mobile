import 'package:app/common/index.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage3 extends StatelessWidget {
  const WelcomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 16),
      Text("Join challenges and earn rewards",
          style: AppTextStyles.headline, textAlign: TextAlign.center),
      const SizedBox(height: Constants.defaultSpaceSize * 10),
      ExtendedImage.asset(AssetsImages.step3,
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
