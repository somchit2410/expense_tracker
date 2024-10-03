import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expense_tracker/common/app_color.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.buttonIcon});
  final FaIcon buttonIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.whiteColor,
      ),
      child: IconButton(
        onPressed: () {},
        icon: buttonIcon,
        color: AppColor.subTextColor,
      ),
    );
  }
}
