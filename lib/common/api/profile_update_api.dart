import 'dart:convert';

import 'package:app/common/index.dart';
import 'package:app/common/models/api_model/profile_update_model.dart';
import 'package:dio/dio.dart';

class ProfileUpdateApi {
  static Future<BasicResponseModel> updateProfile(
      ProfileUpdateModel profileUpdateModel) async {
    Response res = await MyHttpService.to.post(
      '/did/user/profile/update',
      data: profileUpdateModel.toJson(),
      options: Options(
          headers: {"Authorization": "Bearer ${await JwtRs25519.generate()}"}),
    );

    return BasicResponseModel.fromJson(jsonDecode(res.data));
  }

  static Future<void> handleUpdateProfile(
      ProfileUpdateModel profileUpdateModel) async {
    UserInfoModel userInfoModel;
    try {
      await updateProfile(profileUpdateModel);
      userInfoModel = await UserInfoApi.getUserInfo();
      ConfigService.to.myUserInfo = userInfoModel;
      Console.log('[handleUpdateProfile]userInfo: ${userInfoModel.toJson()}');
    } catch (e, s) {
      Console.log('[handleUpdateProfile]error: $e');
      Console.log('[handleUpdateProfile]stackTrace: $s');
    }
  }
}
