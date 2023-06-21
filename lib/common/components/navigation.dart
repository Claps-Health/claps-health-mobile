import 'package:app/common/index.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationItemModel {
  final String unselectImg;
  final String selectedImg;

  NavigationItemModel({
    required this.unselectImg,
    required this.selectedImg,
  });
}

class BuildNavigation extends StatelessWidget {
  final int currentIndex;
  final List<NavigationItemModel> items;
  final Function(int) onTap;

  const BuildNavigation({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> ws = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      NavigationItemModel item = items[i];
      String imgRes = (i == currentIndex) ? item.selectedImg : item.unselectImg;
      ws.add(
        ExtendedImage.asset(imgRes, fit: BoxFit.contain)
            .marginOnly(top: 12)
            .onTap(() => onTap(i))
            .expanded(),
      );
    }

    Gradient appBarGradient = const LinearGradient(
      colors: [
        Colors.transparent,
        Colors.transparent,
        Color(0xFF456d93),
        Color(0xFF456d93),
      ],
      stops: [0.0, 0.5, 0.5, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: ws
          .toRow(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
          )
          .height(90)
          .decorated(gradient: appBarGradient),
    );
  }
}
