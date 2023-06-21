import 'package:app/common/index.dart';
import 'package:isar/isar.dart';

part 'moodrecord.g.dart';

@collection
class MoodRecord {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  FeelingType feelingType;

  int savedTime;

  MoodRecord({required this.feelingType, required this.savedTime});

  @override
  String toString() {
    return 'MoodRecord{feelingType: $feelingType, savedTime: $savedTime}';
  }
}
