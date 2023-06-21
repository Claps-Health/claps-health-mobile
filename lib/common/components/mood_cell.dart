import 'package:app/common/index.dart';
import 'package:flutter/material.dart';

class MoodCell extends StatelessWidget {
  const MoodCell(
      {super.key,
      required this.cellWidth,
      required this.emojiAssetPath,
      required this.moodName,
      required this.onTapAction});
  final double cellWidth;
  final String emojiAssetPath;
  final String moodName;
  final VoidCallback onTapAction;

  Widget _buildEmojiIcon() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final double iconSize = constraints.maxWidth * 1 / 2;
      return Image.asset(
        emojiAssetPath,
        width: iconSize,
        height: iconSize,
        fit: BoxFit.contain,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      _buildEmojiIcon(),
      Text(moodName, style: AppTextStyles.normalSmallText),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
        )
        .card(
          clip: Clip.antiAlias,
          color: Colors.white,
          radius: Constants.defaultSpaceSize,
        )
        .tight(width: cellWidth, height: cellWidth)
        .onTap(onTapAction);
  }
}
