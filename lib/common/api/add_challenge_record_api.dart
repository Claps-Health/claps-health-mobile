import 'dart:convert';

import 'package:app/common/index.dart';
import 'package:dio/dio.dart';

class AddChallengeRecordApi {
  static Future<BasicResponseModel> addChallengeRecord(ChallengeRecord challengeRecord) async {
    Response res = await MyHttpService.to.post(
      '/app/challenge/record/add',
      data: challengeRecord.toJson(),
      options: Options(
          headers: {"Authorization": "Bearer ${await JwtRs25519.generate()}"}),
    );

    return BasicResponseModel.fromJson(jsonDecode(res.data));
  }

  static Future<void> handleAddChallengeRecord(ChallengeRecord challengeRecord) async {
    try {
      await addChallengeRecord(challengeRecord);
    } catch (e, s) {
      Console.log('[handleAddChallengeRecord]error: $e');
      Console.log('[handleAddChallengeRecord]stackTrace: $s');
    }
  }
}