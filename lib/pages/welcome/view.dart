import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: WelcomeController(),
        builder: (controller) => Scaffold(
              body: <Widget>[
                PageView(
                  controller: controller.pageController,
                  children: const [
                    WelcomePage1(),
                    WelcomePage2(),
                    WelcomePage3(),
                    WelcomePage4(),
                  ],
                ),
                SmoothPageIndicator(
                        controller: controller.pageController, // PageController
                        count: 4,
                        effect: const SlideEffect(
                          spacing: 16.0,
                          radius: 6.0,
                          dotWidth: 12.0,
                          dotHeight: 12.0,
                          paintStyle: PaintingStyle.fill,
                          strokeWidth: 1.0,
                          dotColor: Colors.white,
                          activeDotColor: Color(0xFF456d93),
                        ), // your preferred effect
                        onDotClicked: (index) {})
                    .paddingBottom(Constants.defaultSpaceSize * 4)
                    .alignBottom()
              ].toStack().gradientBody(),
            ));
  }
}
