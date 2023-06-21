import 'package:app/common/index.dart';
import 'package:collection/collection.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  Widget _buildHeaderRow() {
    return <Widget>[
      Text("Claps Health", style: AppTextStyles.headline),
      const SizedBox(width: Constants.defaultSpaceSize),
      ExtendedImage.asset(AssetsImages.clap,
          width: 40, height: 40, fit: BoxFit.contain),
    ].toRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
    );
  }

  Widget generateChallengeCardList() {
    return Obx(() {
      int size = ChallengeCardService.to.challengeCardList.length;
      List<Widget> cardList = ChallengeCardService.to.challengeCardList
          .mapIndexed((index, element) {
        ChallengeCardData data = challengeCardDataMapping[element] ??
            ChallengeCardData(cardImageAssetPath: '', cardTitle: '');
        ChallengeCard challengeCard = ChallengeCard(
            cardImageAssetPath: data.cardImageAssetPath,
            cardTitle: data.cardTitle,
            onTapCallback: getChallengeCardOnTapAction(element));
        if (index == size - 1) {
          // last card
          return ChallengeCardAddMore(
            challengeCard: challengeCard,
            addText: 'Add Challenge Card',
            addCallback: () => Get.toNamed(RouteNames.addChallengeCard),
          ).marginOnly(bottom: Constants.defaultSpaceSize);
        } else {
          return challengeCard;
        }
      }).toList();
      return ListView.separated(
          itemBuilder: (ctx, index) => cardList[index],
          separatorBuilder: (ctx, index) =>
              const SizedBox(height: Constants.defaultSpaceSize * 1.5),
          itemCount: size);
    });
  }

  Widget _buildBody() {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 8),
      _buildHeaderRow().alignCenter(),
      const SizedBox(height: Constants.defaultSpaceSize * 0.5),
      generateChallengeCardList().expanded(),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<HomeController>(),
      builder: (controller) => Scaffold(
        body: _buildBody().gradientBody(),
      ),
    );
  }
}
