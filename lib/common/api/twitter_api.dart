import 'dart:convert';

import 'package:app/common/index.dart';
import 'package:dio/dio.dart';

class TwitterApi {
  static Future<BasicResponseModel> verifyTwitterLink(
      VerifyTwitterModel model) async {
    Response res = await MyHttpService.to.post(
      '/did/verify/twitter',
      data: model.toJson(),
    );

    return BasicResponseModel.fromJson(jsonDecode(res.data));
  }
}
