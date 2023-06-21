import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  VoidCallback getStatisticsCardOnTapAction(ChallengeCardType byType) {
    switch (byType) {
      case ChallengeCardType.mood:
        return () => Get.toNamed(RouteNames.moodStatistics);
      case ChallengeCardType.alcohol:
        return () => Get.toNamed(RouteNames.alcoholStatistics);
      case ChallengeCardType.bodyPain:
        return () => Get.toNamed(RouteNames.bodyPainStatistics);
    }
  }
}
