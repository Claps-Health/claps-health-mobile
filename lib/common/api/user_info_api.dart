import 'dart:convert';

import 'package:app/common/index.dart';
import 'package:dio/dio.dart';

class UserInfoApi {
  static Future<UserInfoModel> getUserInfo() async {
    Response res = await MyHttpService.to.get(
      '/did/user',
      options: Options(
          headers: {"Authorization": "Bearer ${await JwtRs25519.generate()}"}),
    );

    return UserInfoModel.fromJson(
        BasicResponseModel.fromJson(jsonDecode(res.data)).data ??
            <String, dynamic>{});
  }

  static Future<int> handleUserAccountLevel() async {
    UserInfoModel userInfoModel;
    try {
      userInfoModel = await getUserInfo();
      ConfigService.to.myUserInfo = userInfoModel;
      Console.log(
          '[handleUserAccountLevel]userInfo: ${userInfoModel.toJson()}');
    } catch (e, s) {
      Console.log('[handleUserAccountLevel]error: $e');
      Console.log('[handleUserAccountLevel]stackTrace: $s');
      return 0;
    }
    return userInfoModel.accountLevel ?? 0;
  }
}
