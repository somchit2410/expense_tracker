import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expense_tracker/common/app_color.dart';

List<Map<String, dynamic>> expenseData = [
  {
    'type': 'House Rent',
    'icon': FaIcon(
      FontAwesomeIcons.house,
      color: AppColor.whiteColor,
    ),
    'circleColor': const Color(0xFFFFB825),
    'amount': '- 1,500,000',
  },
  {
    'type': 'Xbox',
    'icon': FaIcon(
      FontAwesomeIcons.xbox,
      color: AppColor.whiteColor,
    ),
    'circleColor': const Color(0xFFE03333),
    'amount': '- 250,000',
  },
  {
    'type': 'Recharge',
    'icon': FaIcon(
      FontAwesomeIcons.mobile,
      color: AppColor.whiteColor,
    ),
    'circleColor': const Color(0xff1bd3b6),
    'amount': '- 250,000',
  },
  {
    'type': 'Pet Groom',
    'icon': FaIcon(
      FontAwesomeIcons.paw,
      color: AppColor.whiteColor,
    ),
    'circleColor': const Color(0xff1e82e0),
    'amount': '- 150,000',
  },
];
