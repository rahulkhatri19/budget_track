import 'package:budget_track/utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  //date picker
  static Future<String> datePicker(BuildContext context) async {
    String formattedDate = DateFormat(Constant.recordDateFormat).format(DateTime.now());
    DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 90)),
      lastDate: DateTime(2100),
    );

    if (datePicked != null) {
      formattedDate = DateFormat(Constant.recordDateFormat).format(datePicked);
    }
    return formattedDate;
  }

  //time picker
  static Future<String> timePicker(BuildContext context) async {
    String formattedTime = TimeOfDay.now().format(context);
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context, //context of current state
    );

    if (pickedTime != null) {
      if (context.mounted) {
        formattedTime = pickedTime.format(context);
      }
    }
    return formattedTime;
  }
}
