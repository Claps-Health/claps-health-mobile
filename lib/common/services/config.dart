import 'package:app/common/index.dart';
import 'package:get/get.dart';

class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  //----------------------------------------------------------
  MnemonicWithKey? _mnemonicWithKey;

  void setUserMnemonicWithKey(Map<String, dynamic> dataMap) {
    _mnemonicWithKey = MnemonicWithKey.fromJson(dataMap);
  }

  MnemonicWithKey? get mnemonicWithKey => _mnemonicWithKey;

  Future<String> myUserDID() async {
    if (_mnemonicWithKey == null) {
      return "";
    }
    return await generateDID(_mnemonicWithKey!.publicKey);
  }

  //----------------------------------------------------------
  UserInfoModel? myUserInfo;
}
