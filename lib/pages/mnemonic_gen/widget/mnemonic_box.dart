import 'package:app/common/index.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MnemonicBox extends StatelessWidget {
  const MnemonicBox(
      {super.key, required this.mnemonicPhrase, required this.renewOnTap});
  final String mnemonicPhrase;
  final VoidCallback renewOnTap;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Text(mnemonicPhrase, style: AppTextStyles.mnemonicText)
          .marginOnly(top: Constants.defaultSpaceSize * 2)
          .expanded(),
      ExtendedImage.asset(
        AssetsImages.renew,
        width: 24,
        fit: BoxFit.cover,
      ).onTap(renewOnTap),
    ]
        .toRow(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .marginOnly(
          left: Constants.defaultSpaceSize * 2,
          right: Constants.defaultSpaceSize,
          top: Constants.defaultSpaceSize,
          bottom: Constants.defaultSpaceSize * 2,
        )
        .decorated(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Constants.defaultSpaceSize),
        );
  }
}
