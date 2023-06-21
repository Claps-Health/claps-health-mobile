import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlcoholController extends GetxController {
  TextEditingController beerCcAmountController = TextEditingController();
  TextEditingController wineCcAmountController = TextEditingController();
  TextEditingController spiritsCcAmountController = TextEditingController();

  TextEditingController getAlcoholCcAmountController(AlcoholType type) {
    switch (type) {
      case AlcoholType.beer:
        return beerCcAmountController;
      case AlcoholType.wine:
        return wineCcAmountController;
      case AlcoholType.spirits:
        return spiritsCcAmountController;
    }
  }

  void onRecordTap() {
    Console.log("[beer]: ${beerCcAmountController.text}");
    Console.log("[wine]: ${wineCcAmountController.text}");
    Console.log("[spirits]: ${spiritsCcAmountController.text}");
    //prevent 3 controller text are empty
    if (beerCcAmountController.text.isEmpty &&
        wineCcAmountController.text.isEmpty &&
        spiritsCcAmountController.text.isEmpty) {
      Loading.toast("Please enter at least one value");
      return;
    } else {
      Get.toNamed(RouteNames.alcoholDate, arguments: {
        AlcoholType.beer.name:
            double.tryParse(beerCcAmountController.text) ?? 0.0,
        AlcoholType.wine.name:
            double.tryParse(wineCcAmountController.text) ?? 0.0,
        AlcoholType.spirits.name:
            double.tryParse(spiritsCcAmountController.text) ?? 0.0,
      });
    }
  }

  @override
  void onClose() {
    // destroy the controller when not in use
    beerCcAmountController.dispose();
    wineCcAmountController.dispose();
    spiritsCcAmountController.dispose();
    super.onClose();
  }
}
