import 'package:app/common/index.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GreyDropdown extends StatelessWidget {
  const GreyDropdown(
      {super.key,
      required this.menuItems,
      required this.hintText,
      this.onChangeFn,
      required this.dropdownWidth});

  final List<KeyValueModel> menuItems;
  final String hintText;
  final void Function(KeyValueModel? value)? onChangeFn;
  final double dropdownWidth;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2<KeyValueModel>(
      items: menuItems
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item.value.toString(),
                  style: AppTextStyles.mediumBkText,
                  overflow: TextOverflow.ellipsis,
                ).width(dropdownWidth * 0.8),
              ))
          .toList(),
      hint: Text(
        hintText,
        style: AppTextStyles.mediumBkText,
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
          color: const Color(0xFFe5e5e5),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: dropdownWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFe5e5e5),
          )),
      menuItemStyleData: const MenuItemStyleData(
        height: 44,
        padding: EdgeInsets.symmetric(horizontal: Constants.defaultSpaceSize),
      ),
    ));
  }
}
