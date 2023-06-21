import 'package:app/common/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class StatisticsPage extends GetView<StatisticsController> {
  const StatisticsPage({super.key});

  Widget generateStatisticsCardList() {
    return Obx(() {
      int size = ChallengeCardService.to.challengeCardList.length;
      List<Widget> cardList = ChallengeCardService.to.challengeCardList
          .mapIndexed((index, element) {
        ChallengeCardData data = challengeCardDataMapping[element] ??
            ChallengeCardData(cardImageAssetPath: '', cardTitle: '');
        ChallengeCard challengeCard = ChallengeCard(
            cardImageAssetPath: data.cardImageAssetPath,
            cardTitle: data.cardTitle,
            onTapCallback: controller.getStatisticsCardOnTapAction(element));
        return challengeCard;
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
      Text('Statistics', style: AppTextStyles.headline).alignCenter(),
      const SizedBox(height: Constants.defaultSpaceSize),
      generateStatisticsCardList().expanded(),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<StatisticsController>(),
      builder: (controller) => Scaffold(
        body: _buildBody().gradientBody(),
      ),
    );
  }
}
