// {
//   "app_id": "mood_jouraling", // mood_jouraling/ reduce_alcohol/ body_pain
//   "data": {
//     "app": {
//       "time": 1686022651000,
//       "time_end": null,
//       "content": {"mood": "happy"}
//     },
//     "blockchain": {"txid": "0x92354d95c16c860057cf82835a09403d6f21fce1bab1b28ea2182ec4e61c9aa6"}
//   }
// }

import 'data.dart';

class ChallengeRecord {
  String? appId;
  Data? data;

  ChallengeRecord({this.appId, this.data});

  @override
  String toString() => 'ChallengeRecord(appId: $appId, data: $data)';

  factory ChallengeRecord.fromJson(Map<String, dynamic> json) {
    return ChallengeRecord(
      appId: json['app_id'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'app_id': appId,
        'data': data?.toJson(),
      };
}
