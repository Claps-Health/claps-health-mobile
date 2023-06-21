import 'dart:convert';

import 'package:app/common/index.dart';
import 'package:dio/dio.dart';

class RegisterApi {
  static Future<BasicResponseModel> register(
      RegisterModel registerModel) async {
    Response res = await MyHttpService.to.post(
      '/did/register',
      data: registerModel.toJson(),
    );

    return BasicResponseModel.fromJson(jsonDecode(res.data));
  }

  static Future<bool> handleNewRegister() async {
    BasicResponseModel responseModel;
    try {
      responseModel = await register(RegisterModel(
        pubkey: ConfigService.to.mnemonicWithKey?.publicKey ?? '',
        did: await ConfigService.to.myUserDID(),
        signature: await CrossPlatformUtils.getSignatureWithMsg(
            Constants.didRegisterMessage,
            ConfigService.to.mnemonicWithKey?.privateKey ?? ''),
      ));
      Console.log(
          '[handleNewRegister]responseModel: ${responseModel.toJson()}');
    } catch (e) {
      Console.log('[handleNewRegister]error: $e');
      return false;
    }
    return responseModel.error == 0;
  }
}
