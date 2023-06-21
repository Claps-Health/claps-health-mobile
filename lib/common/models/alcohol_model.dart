import 'package:app/common/index.dart';

enum AlcoholType {
  beer(AssetsImages.alcoholBeer, 'Beer', '5%'),
  wine(AssetsImages.alcoholWine, 'Wine', '12-15%'),
  spirits(AssetsImages.alcoholSpirits, 'Spirits', '40%');

  const AlcoholType(this.imagePath, this.alcoholName, this.avgPercent);
  final String imagePath;
  final String alcoholName;
  final String avgPercent;
}
