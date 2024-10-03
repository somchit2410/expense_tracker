import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expense_tracker/common/app_color.dart';

List<Map<String, dynamic>> transactionData = [
  {
    'type': 'Food',
    'icon': FaIcon(
      FontAwesomeIcons.burger,
      color: AppColor.whiteColor,
    ),
    'circleColor': const Color(0xFFFFB825),
    'amount': '- 50,000',
    'date': '2/2/2022',
  },
  {
    'type': 'Shopping',
    'icon': FaIcon(
      FontAwesomeIcons.bagShopping,
      color: AppColor.whiteColor,
    ),
    'circleColor': const Color(0xFF7535E6),
    'amount': '- 680,000',
    'date': '2/2/2022',
  },
  {
    'type': 'Entertainment',
    'icon': FaIcon(
      FontAwesomeIcons.music,
      color: AppColor.whiteColor,
    ),
    'circleColor': const Color(0xFFE03333),
    'amount': '- 250,000',
    'date': '2/2/2022',
  },
  {
    'type': 'Travel',
    'icon': FaIcon(
      FontAwesomeIcons.plane,
      color: AppColor.whiteColor,
    ),
    'circleColor': const Color(0xff1bd3b6),
    'amount': '- 1,250,000',
    'date': '2/2/2022',
  },
  {
    'type': 'Pet',
    'icon': FaIcon(
      FontAwesomeIcons.dog,
      color: AppColor.whiteColor,
    ),
    'circleColor': const Color(0xff1e82e0),
    'amount': '- 550,000',
    'date': '2/2/2022',
  },
];
