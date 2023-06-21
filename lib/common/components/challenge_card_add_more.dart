import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengeCardAddMore extends StatelessWidget {
  const ChallengeCardAddMore(
      {super.key,
      required this.challengeCard,
      required this.addText,
      required this.addCallback});

  final ChallengeCard challengeCard;
  final String addText;
  final VoidCallback addCallback;

  Widget _buildAddPart() {
    return Container(
      width: double.infinity,
      height: 90,
      alignment: Alignment.bottomLeft,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsImages.cardAdd), fit: BoxFit.fill),
      ),
      child: Text(addText, style: AppTextStyles.addCardText).marginOnly(
          left: Constants.defaultSpaceSize * 5.5,
          bottom: Constants.defaultSpaceSize * 1.5),
    ).onTap(addCallback);
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      _buildAddPart().marginOnly(top: 45),
      challengeCard,
    ].toStack();
  }
}
