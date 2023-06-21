import 'package:app/pages/body_pain_stat_detail/index.dart';
import 'package:flutter/material.dart';
import 'package:app/common/index.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PainStatisticsContent extends StatelessWidget {
  const PainStatisticsContent({super.key, required this.bodyPainRecord});

  final BodyPainRecord bodyPainRecord;

  Widget _buildTopRow() {
    return <Widget>[
      Text('Area: ${bodyPainRecord.bodyDetailPart}',
          style: AppTextStyles.mediumBkText),
      Text(
          DateFormat('yyyy/MM/dd').format(
              DateTime.fromMillisecondsSinceEpoch(bodyPainRecord.startTime)),
          style: AppTextStyles.mediumBkText),
    ].toRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start);
  }

  String getDurationText() {
    String startTime = DateFormat('h:mm a')
        .format(DateTime.fromMillisecondsSinceEpoch(bodyPainRecord.startTime));
    if (bodyPainRecord.isOngoing) {
      return '$startTime - Ongoing';
    } else {
      String endTime = DateFormat('h:mm a')
          .format(DateTime.fromMillisecondsSinceEpoch(bodyPainRecord.endTime!));
      return '$startTime - $endTime';
    }
  }

  Widget _buildIncreaseReason() {
    if (bodyPainRecord.painIncreaseReason != null &&
        bodyPainRecord.painIncreaseReason!.isNotEmpty) {
      return <Widget>[
        const SizedBox(height: Constants.defaultSpaceSize),
        Text('Pain increase with: ${bodyPainRecord.painIncreaseReason}',
            style: AppTextStyles.mediumBkText),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildDecreaseReason() {
    if (bodyPainRecord.painDecreaseReason != null &&
        bodyPainRecord.painDecreaseReason!.isNotEmpty) {
      return <Widget>[
        const SizedBox(height: Constants.defaultSpaceSize),
        Text('Pain decrease with: ${bodyPainRecord.painDecreaseReason}',
            style: AppTextStyles.mediumBkText),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      _buildTopRow(),
      const SizedBox(height: Constants.defaultSpaceSize),
      Text('Pain level: ${bodyPainRecord.painLevel.toInt()}',
          style: AppTextStyles.mediumBkText),
      const SizedBox(height: Constants.defaultSpaceSize),
      Text('Pain type: ${bodyPainRecord.painType.dispName}',
          style: AppTextStyles.mediumBkText),
      const SizedBox(height: Constants.defaultSpaceSize),
      Text('Duration: ${getDurationText()}', style: AppTextStyles.mediumBkText),
      _buildIncreaseReason(),
      _buildDecreaseReason(),
      const WideDivider(),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
    );
  }
}
