import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard(
      {super.key,
      required this.cardImageAssetPath,
      required this.cardTitle,
      required this.onTapCallback});

  final String cardImageAssetPath;
  final String cardTitle;
  final VoidCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(cardImageAssetPath), fit: BoxFit.fill),
      ),
      child: Text(cardTitle, style: AppTextStyles.challengeCardText)
          .marginOnly(left: Constants.defaultSpaceSize * 6),
    ).onTap(onTapCallback);
  }
}
