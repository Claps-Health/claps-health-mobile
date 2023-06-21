import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({super.key});

  Widget _buildRichTextForAccountLevel() {
    StringBuffer sb = StringBuffer();
    sb.write(
        'Your account level represents your engagement and commitment in the Claps Health App. It is calculated based on two main factors:\n\n');
    sb.write(
        '1. Verification Steps: Completing profile verification steps such as email verification, phone number verification, and Twitter verification can increase your account level.\n\n');
    sb.write(
        '2. Activity: Regularly participating in health challenges, completing tasks, and consistently reporting your progress can also boost your level.\n\n');
    sb.write(
        'The higher your account level, the more benefits and rewards you can receive within the Claps Health App. This includes increased airdrop weight for Health Points, access to advanced challenges, and more.');
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text:
                  'User account level includes the benefits for each level, please click button for details information.',
              style: AppTextStyles.mediumBkText),
          TextSpan(
            text: ' Click here for more information about Account Level.',
            style: AppTextStyles.redMediumBkText,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Console.log('[Account Level Clicked]');
                showMessagePopup(
                  upperText: "About Account Level",
                  contentText: sb.toString(),
                  btnTxt: "Close",
                  onPressed: () => Get.back(),
                );
              },
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 6),
      Text("My Account", style: AppTextStyles.headline).center(),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      Text("Profile Setting", style: AppTextStyles.inputTitle),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text(
          "Verifying your account provides additional benefits and helps us maintain a secure and rewarding environment for all users. Your privacy is important to us, and we will never share your email or social media account with third parties. Verified email addresses will only be used for important notices from Claps Health.",
          style: AppTextStyles.mediumBkText),
      const SizedBox(height: Constants.defaultSpaceSize * 5),
      InfoItemRow(
              itemTitle: "My ID",
              buttonText: "View",
              pressCallback: controller.onViewMyID)
          .alignRight(),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      InfoItemRow(
              itemTitle: "Profile",
              buttonText: "Update",
              pressCallback: controller.onUpdateProfile)
          .alignRight(),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      InfoItemRow(
              itemTitle: "Email",
              buttonText: "Verify",
              pressCallback: controller.onEmailVerify)
          .alignRight(),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      InfoItemRow(
              itemTitle: "Twitter",
              buttonText: "Verify",
              pressCallback: controller.onTwitterVerifyTap)
          .alignRight(),
      const SizedBox(height: Constants.defaultSpaceSize * 5),
      const GrayTopic(topicName: "Security Backup"),
      const SizedBox(height: Constants.defaultSpaceSize * 5),
      Text("Security Backup", style: AppTextStyles.inputTitle),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text(
          "The Secret Recovery Phrase grants complete access to your Claps Health app. Claps Health is a non-custodial wallet, meaning you are the sole owner of your Secret Recovery Phrase. It is crucial to securely store your recovery phrase and ensure its safety, as it is the key to accessing your data wallet and managing your health points.",
          style: AppTextStyles.mediumBkText),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      const GrayDotDescription(title: "Do not share your SRP with anyone."),
      const GrayDotDescription(
          title:
              "Do not store your SRP in a location that is easily accessible to others."),
      const GrayDotDescription(
          title:
              "Write down your SRP and store it in a safe place, such as a secure physical location or an encrypted digital storage."),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text("Secret Recovery Phrase", style: AppTextStyles.inputTitle),
      const SizedBox(height: Constants.defaultSpaceSize),
      mainElevatedButton(
          onPressed: controller.onSecretRecoveryPhraseTap, text: "View"),
      const SizedBox(height: Constants.defaultSpaceSize * 5),
      Text("Account Level", style: AppTextStyles.inputTitle),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      _buildRichTextForAccountLevel(),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Obx(() => ExtendedImage.asset(controller.myAccountLevelImg.value,
              width: double.infinity, fit: BoxFit.contain))
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 8),
      const SizedBox(height: Constants.defaultSpaceSize * 40),
      Text("Delete My Account", style: AppTextStyles.inputTitle),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text("Permanently remove your account and all associated data.",
          style: AppTextStyles.mediumBkText),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text(
          "Warning: Deleting your account is a permanent action and cannot be undone. All your account data, including your profile, challenges, and rewards, will be permanently removed. Please consider carefully before proceeding.",
          style: AppTextStyles.redMediumBkText),
      const SizedBox(height: Constants.defaultSpaceSize * 45),
      Text("Yes, I want to", style: AppTextStyles.mediumTitle),
      const SizedBox(height: Constants.defaultSpaceSize),
      mainElevatedButton(
          onPressed: () => showConfirmInputDialog(
                upperText: "Delete My Account",
                contentText:
                    "Please enter your password to confirm you would like to permanently delete your account.",
                inputEditingController:
                    controller.deleteAccountPwdEditingController,
                isInputObscure: true,
                confirmCallback: controller.deleteAccountConfirm,
              ),
          text: "DELETE MY ACCOUNT"),
      const SizedBox(height: Constants.defaultSpaceSize * 12),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
        .scrollable(scrollDirection: Axis.vertical)
        .gradientBody();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<AccountController>(),
      builder: (controller) => Scaffold(
        body: _buildBody(),
      ),
    );
  }
}
