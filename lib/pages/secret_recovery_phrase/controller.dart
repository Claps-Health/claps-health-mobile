import 'package:app/common/index.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SecretRecoveryPhraseController extends GetxController {
  void onSrpBoxTap() {
    Clipboard.setData(ClipboardData(
            text: ConfigService.to.mnemonicWithKey?.mnemonic ?? ""))
        .then((_) => Loading.toast("SRP is copied to clipboard"));
  }
}
