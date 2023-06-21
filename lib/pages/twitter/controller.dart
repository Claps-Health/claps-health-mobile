import 'package:app/common/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class TwitterController extends GetxController {
  RxString twitterMsgContent = "".obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController twitterLinkController = TextEditingController();

  @override
  void onInit() {
    updateTwitterMsgContent();
    super.onInit();
  }

  Future<void> updateTwitterMsgContent() async {
    String signature = await CrossPlatformUtils.getSignatureWithMsg(
        Constants.didVerificationMessageTwitter,
        ConfigService.to.mnemonicWithKey?.privateKey ?? "");
    twitterMsgContent.value =
        "${Constants.didVerificationMessageTwitter} sig:$signature";
  }

  void openTwitterPost() {
    Share.share(twitterMsgContent.value);
  }

  Future<void> onVerificationTwitterTap() async {
    if ((formKey.currentState as FormState).validate()) {
      Console.log("[TwitterLinkForm]validate success");
      Loading.show();
      String myDID = await ConfigService.to.myUserDID();
      try {
        BasicResponseModel res = await TwitterApi.verifyTwitterLink(
            VerifyTwitterModel(
                did: myDID, link: twitterLinkController.text.split("?")[0]));
        await Loading.dismiss();
        if (res.error == 0) {
          Storage().setBool(Constants.isTwitterVerifiedKey, true);
          Get.offNamed(RouteNames.twitterVerified);
        } else {
          Loading.toast("Verification failed, ${res.error}");
        }
      } catch (e, s) {
        await Loading.dismiss();
        Loading.toast("Verification failed");
        Console.log("[TwitterPageFail]${e.toString()}\n${s.toString()}");
      }
    }
  }
}
