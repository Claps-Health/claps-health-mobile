import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class AddChallengeCardPage extends GetView<AddChallengeCardController> {
  const AddChallengeCardPage({super.key});

  List<Widget> generateAddCardList() {
    List<Widget> cardList = challengeCardDataMapping.keys.map<Widget>((key) {
      ChallengeCardData data = challengeCardDataMapping[key] ??
          ChallengeCardData(cardImageAssetPath: '', cardTitle: '');
      Widget challengeCard = Obx(() {
        return ChallengeCard(
            cardImageAssetPath:
                ChallengeCardService.to.challengeCardList.contains(key)
                    ? data.cardImageAssetPath
                    : AssetsImages.cardPlainWhite,
            cardTitle: data.cardTitle,
            onTapCallback: getAddChallengeCardAction(key));
      }).marginOnly(bottom: Constants.defaultSpaceSize * 1.5);
      return challengeCard.marginSymmetric(
          horizontal: Constants.defaultSpaceSize * 2);
    }).toList();

    return cardList;
  }

  Widget _buildView() {
    return <Widget>[
      Text("Add Challenge Card", style: AppTextStyles.headline)
          .marginOnly(top: Constants.defaultSpaceSize * 8)
          .center(),
      const SizedBox(height: Constants.defaultSpaceSize * 6),
      ...generateAddCardList(),
      const Spacer(),
      mainElevatedButton(onPressed: Get.back, text: 'OK')
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 6),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddChallengeCardController>(
      init: AddChallengeCardController(),
      id: "add_challenge_card",
      builder: (_) {
        return Scaffold(
          body: _buildView().gradientBody(),
        );
      },
    );
  }
}
