import 'package:app/common/index.dart';
import 'package:isar/isar.dart';

part 'bodypainrecord.g.dart';

@collection
class BodyPainRecord {
  Id id = Isar.autoIncrement;

  int clickBodyIndex;

  @Enumerated(EnumType.name)
  BodyParts bodySectionPart;

  String bodyDetailPart;
  double painLevel;

  @Enumerated(EnumType.name)
  PainType painType;

  int startTime;
  bool isOngoing;
  int? endTime;

  String? painIncreaseReason;
  String? painDecreaseReason;

  BodyPainRecord({
    required this.clickBodyIndex,
    required this.bodySectionPart,
    required this.bodyDetailPart,
    required this.painLevel,
    required this.painType,
    required this.startTime,
    required this.isOngoing,
    this.endTime,
    this.painIncreaseReason,
    this.painDecreaseReason,
  });

  @override
  String toString() {
    return 'BodyPainRecord{id: $id, clickBodyIndex: $clickBodyIndex, bodySectionPart: $bodySectionPart, bodyDetailPart: $bodyDetailPart, painLevel: $painLevel, painType: $painType, startTime: $startTime, isOngoing: $isOngoing, endTime: $endTime, painIncreaseReason: $painIncreaseReason, painDecreaseReason: $painDecreaseReason}';
  }
}
