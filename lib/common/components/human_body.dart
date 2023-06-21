import 'package:flutter/material.dart';
import 'package:app/common/index.dart';
import 'package:get/get.dart';

class HumanBody extends StatelessWidget {
  const HumanBody(
      {super.key, required this.bodyVisibleList, required this.onTapBodyPart});

  final List<RxBool> bodyVisibleList; //length 13
  final void Function(int bodyIdx) onTapBodyPart;

  @override
  Widget build(BuildContext context) {
    final List<Pair> bodySizePairs = [
      Pair(350, 848), //0, whole body
      Pair(350, 60), //1
      Pair(350, 61), //2
      Pair(350, 41), //3
      Pair(144, 109), //4
      Pair(144, 97), //5
      Pair(165, 91), //6
      Pair(103, 158), //7
      Pair(103, 188), //8
      Pair(103, 158), //9
      Pair(103, 188), //10
      Pair(82, 389), //11
      Pair(83, 389), //12
    ];

    num h1 = bodySizePairs[1].right;
    num h12 = bodySizePairs[1].right + bodySizePairs[2].right;
    num h123 = bodySizePairs[1].right +
        bodySizePairs[2].right +
        bodySizePairs[3].right;
    num h1234 = h123 + bodySizePairs[4].right;
    num h12345 = h1234 + bodySizePairs[5].right;
    num h123456 = h12345 + bodySizePairs[6].right;
    num h1237 = h123 + bodySizePairs[7].right;
    num h1239 = h123 + bodySizePairs[9].right;

    num w4 = bodySizePairs[4].left;
    num w5 = bodySizePairs[5].left;
    num w6 = bodySizePairs[6].left;
    num w7 = bodySizePairs[7].left;
    num w8 = bodySizePairs[8].left;
    num w9 = bodySizePairs[9].left;
    num w10 = bodySizePairs[10].left;
    num w11 = bodySizePairs[11].left;
    num w12 = bodySizePairs[12].left;
    num w74 = bodySizePairs[7].left + bodySizePairs[4].left;
    num w7_11 = bodySizePairs[7].left + bodySizePairs[11].left;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final double imgWidth = constraints.maxWidth * 0.59;
      final scaleFactor = imgWidth / 350.0;
      return <Widget>[
        Image.asset(AssetsImages.body,
            width: imgWidth, scale: scaleFactor, fit: BoxFit.fill),
        Obx(() => Image.asset(AssetsImages.body01,
                    width: imgWidth, scale: scaleFactor, fit: BoxFit.fill)
                .visibility(bodyVisibleList[1].value))
            .onTap(() => onTapBodyPart(1))
            .positioned(top: 0, left: 0),
        Obx(() => Image.asset(AssetsImages.body02,
                    width: imgWidth, scale: scaleFactor, fit: BoxFit.fill)
                .visibility(bodyVisibleList[2].value))
            .onTap(() => onTapBodyPart(2))
            .positioned(top: h1 * scaleFactor, left: 0),
        Obx(() => Image.asset(AssetsImages.body03,
                    width: imgWidth, scale: scaleFactor, fit: BoxFit.fill)
                .visibility(bodyVisibleList[3].value))
            .onTap(() => onTapBodyPart(3))
            .positioned(top: h12 * scaleFactor, left: 0),
        Obx(() => Image.asset(AssetsImages.body07,
                    width: w7 * scaleFactor,
                    scale: scaleFactor,
                    fit: BoxFit.fill)
                .visibility(bodyVisibleList[7].value))
            .onTap(() => onTapBodyPart(7))
            .positioned(top: h123 * scaleFactor, left: 0),
        Obx(() => Image.asset(AssetsImages.body08,
                    width: w8 * scaleFactor,
                    scale: scaleFactor,
                    fit: BoxFit.fill)
                .visibility(bodyVisibleList[8].value))
            .onTap(() => onTapBodyPart(8))
            .positioned(top: h1237 * scaleFactor, left: 0),
        Obx(() => Image.asset(AssetsImages.body04,
                    width: w4 * scaleFactor,
                    scale: scaleFactor,
                    fit: BoxFit.fill)
                .visibility(bodyVisibleList[4].value))
            .onTap(() => onTapBodyPart(4))
            .positioned(top: h123 * scaleFactor, left: w7 * scaleFactor),
        Obx(() => Image.asset(AssetsImages.body05,
                    width: w5 * scaleFactor,
                    scale: scaleFactor,
                    fit: BoxFit.fill)
                .visibility(bodyVisibleList[5].value))
            .onTap(() => onTapBodyPart(5))
            .positioned(top: h1234 * scaleFactor, left: w7 * scaleFactor),
        Obx(() => Image.asset(AssetsImages.body06,
                    width: w6 * scaleFactor,
                    scale: scaleFactor,
                    fit: BoxFit.fill)
                .visibility(bodyVisibleList[6].value))
            .onTap(() => onTapBodyPart(6))
            .positioned(top: h12345 * scaleFactor, left: w7 * scaleFactor - 5),
        Obx(() => Image.asset(AssetsImages.body11,
                    width: w11 * scaleFactor,
                    scale: scaleFactor,
                    fit: BoxFit.fill)
                .visibility(bodyVisibleList[11].value))
            .onTap(() => onTapBodyPart(11))
            .positioned(top: h123456 * scaleFactor, left: w7 * scaleFactor - 5),
        Obx(() => Image.asset(AssetsImages.body12,
                    width: w12 * scaleFactor,
                    scale: scaleFactor,
                    fit: BoxFit.fill)
                .visibility(bodyVisibleList[12].value))
            .onTap(() => onTapBodyPart(12))
            .positioned(
                top: h123456 * scaleFactor, left: w7_11 * scaleFactor - 5),
        Obx(() => Image.asset(AssetsImages.body09,
                    width: w9 * scaleFactor,
                    scale: scaleFactor,
                    fit: BoxFit.fill)
                .visibility(bodyVisibleList[9].value))
            .onTap(() => onTapBodyPart(9))
            .positioned(top: h123 * scaleFactor, left: w74 * scaleFactor),
        Obx(() => Image.asset(AssetsImages.body10,
                    width: w10 * scaleFactor,
                    scale: scaleFactor,
                    fit: BoxFit.fill)
                .visibility(bodyVisibleList[10].value))
            .onTap(() => onTapBodyPart(10))
            .positioned(top: h1239 * scaleFactor, left: w74 * scaleFactor),
      ].toStack();
    });
  }
}
