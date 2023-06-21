import 'package:app/common/index.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDropdownButton extends StatelessWidget {
  const AppDropdownButton({
    super.key,
    required this.itemTitle,
    required this.menuItems,
    required this.hintText,
    required this.onChangeFn,
    required this.dropdownWidth,
    this.titleBottomMargin = Constants.defaultSpaceSize * 0.5,
  });

  final String itemTitle;
  final List<KeyValueModel> menuItems;
  final String hintText;
  final void Function(KeyValueModel? value)? onChangeFn;
  final double dropdownWidth;
  final double titleBottomMargin;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Text(itemTitle, style: AppTextStyles.inputTitle),
      SizedBox(height: titleBottomMargin),
      DropdownButtonHideUnderline(
          child: DropdownButton2<KeyValueModel>(
        items: menuItems
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.value.toString(),
                    style: AppTextStyles.normalSmallText,
                    overflow: TextOverflow.ellipsis,
                  ).width(dropdownWidth * 0.8),
                ))
            .toList(),
        hint: Text(
          hintText,
          style: AppTextStyles.normalSmallText,
        ).marginOnly(left: Constants.defaultSpaceSize),
        onChanged: onChangeFn,
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.expand_more,
          ),
          iconSize: 36,
          iconEnabledColor: Color(0xFF898989),
          iconDisabledColor: Color(0xFF898989),
        ),
        buttonStyleData: ButtonStyleData(
          height: 44,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: dropdownWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            )),
        menuItemStyleData: const MenuItemStyleData(
          height: 44,
          padding: EdgeInsets.symmetric(horizontal: Constants.defaultSpaceSize),
        ),
      )),
    ].toColumn(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
