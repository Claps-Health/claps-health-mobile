import 'package:app/common/index.dart';

enum WeekdayItem { Mon, Tue, Wed, Thu, Fri, Sat, Sun }

class FeelDaysModel {
  final FeelingType feelingType;
  final int days;

  FeelDaysModel({required this.feelingType, required this.days});
}
