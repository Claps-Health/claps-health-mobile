import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final Map<ChallengeCardType, ChallengeCardData> challengeCardDataMapping = {
  ChallengeCardType.mood: ChallengeCardData(
    cardImageAssetPath: AssetsImages.cardRed,
    cardTitle: 'Mood Journaling',
  ),
  ChallengeCardType.alcohol: ChallengeCardData(
    cardImageAssetPath: AssetsImages.cardGreen,
    cardTitle: 'Reduce Alcohol',
  ),
  ChallengeCardType.bodyPain: ChallengeCardData(
    cardImageAssetPath: AssetsImages.cardOrange,
    cardTitle: 'Body Pain Management',
  ),
};

List<ChallengeCardType> initChallengeCardList() {
  List<String> challengeCardStoredList =
      Storage().getListOfString(Constants.challengeCardStoreKey);
  if (challengeCardStoredList.isEmpty) {
    Console.log(
        '[initChallengeCardList] no list stored, init with default list');
    Storage().setListOfString(
        Constants.challengeCardStoreKey, [ChallengeCardType.mood.name]);
    return [ChallengeCardType.mood];
  } else {
    Console.log('[initChallengeCardList] list stored, init with stored list');
    return challengeCardStoredList
        .map((String cardTypeName) =>
            ChallengeCardType.values.byName(cardTypeName))
        .toList();
  }
}

VoidCallback getChallengeCardOnTapAction(ChallengeCardType byType) {
  switch (byType) {
    case ChallengeCardType.mood:
      return () => Get.toNamed(RouteNames.mood);
    case ChallengeCardType.alcohol:
      return () => Get.toNamed(RouteNames.alcohol);
    case ChallengeCardType.bodyPain:
      return () => Get.toNamed(RouteNames.bodyPain);
  }
}

VoidCallback getAddChallengeCardAction(ChallengeCardType byType) {
  return () {
    if (byType == ChallengeCardType.mood)
      return; // mood card cannot be removed or added

    List<String> challengeCardStoredList =
        Storage().getListOfString(Constants.challengeCardStoreKey);
    if (!challengeCardStoredList.contains(byType.name)) {
      challengeCardStoredList.add(byType.name);
      Storage().setListOfString(
          Constants.challengeCardStoreKey, challengeCardStoredList);
      ChallengeCardService.to.challengeCardList.add(byType);
    } else {
      challengeCardStoredList.remove(byType.name);
      Storage().setListOfString(
          Constants.challengeCardStoreKey, challengeCardStoredList);
      ChallengeCardService.to.challengeCardList.remove(byType);
    }
  };
}
