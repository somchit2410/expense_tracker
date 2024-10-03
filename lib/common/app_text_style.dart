import 'package:flutter/material.dart';
import 'package:expense_tracker/common/app_color.dart';

class AppTextStyle {
  static TextStyle appTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColor.titleTextColor,
  );
  static TextStyle appSubTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.subTextColor,
  );
}
