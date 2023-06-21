enum ChallengeCardType {
  mood,
  alcohol,
  bodyPain,
}

class ChallengeCardData {
  final String cardImageAssetPath;
  final String cardTitle;

  ChallengeCardData({
    required this.cardImageAssetPath,
    required this.cardTitle,
  });
}
