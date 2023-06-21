import 'package:app/common/index.dart';
import 'package:isar/isar.dart';

part 'alcoholrecord.g.dart';

@collection
class AlcoholRecord {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  AlcoholType alcoholType;

  int savedTime;

  double amount;

  AlcoholRecord({
    required this.alcoholType,
    required this.savedTime,
    required this.amount,
  });
}
