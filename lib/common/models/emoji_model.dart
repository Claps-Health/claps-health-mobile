enum FeelingType {
  happy,
  sad,
  tired,
  angry,
  excited,
  calm,
  anxious,
  frustrated,
  confused,
  relaxed,
  enthusiastic,
  bored,
  melancholy,
  irritated,
  energized,
}

class FeelingModel {
  final String emojiAssetPath;
  final String title;

  FeelingModel({
    required this.emojiAssetPath,
    required this.title,
  });
}
