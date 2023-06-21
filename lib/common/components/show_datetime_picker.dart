import 'package:flutter/cupertino.dart';

void showDatetimePicker(BuildContext context, DateTime initDateTime,
    DateTime? maxDateTime, void Function(DateTime newDate) dateTimeChangeFn) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      // The Bottom margin is provided to align the popup above the system
      // navigation bar.
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      // Provide a background color for the popup.
      color: CupertinoColors.systemBackground.resolveFrom(context),
      // Use a SafeArea widget to avoid system overlaps.
      child: SafeArea(
        top: false,
        child: CupertinoDatePicker(
          initialDateTime: initDateTime,
          maximumDate: maxDateTime,
          mode: CupertinoDatePickerMode.dateAndTime,
          use24hFormat: true,
          // This is called when the user changes the date.
          onDateTimeChanged: dateTimeChangeFn,
        ),
      ),
    ),
  );
}
