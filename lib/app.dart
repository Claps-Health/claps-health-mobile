import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Claps Health',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: appInitRoute(),
      getPages: RoutePages.list,
      navigatorObservers: [RoutePages.observer],
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    );
  }

  String appInitRoute() {
    bool secretBoxExist = Storage().containsKey(Constants.mySecretBoxKey);

    return secretBoxExist ? RouteNames.signin : RouteNames.welcome;
    // return RouteNames.bodyPain;
  }
}
