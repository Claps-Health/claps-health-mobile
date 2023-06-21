import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Global {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    // Below is for the scenario the first page not correctly displayed
    // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    setSystemUi();

    // Utilities
    await Storage().init();
    Loading();

    Get.put<IsarService>(IsarService());
    Get.put<ConfigService>(ConfigService());
    Get.put<ChallengeCardService>(ChallengeCardService());
    Get.put<MyHttpService>(MyHttpService());
  }

  static void setSystemUi() {
    if (GetPlatform.isMobile) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
  }
}
