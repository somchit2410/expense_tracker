import 'package:expense_tracker/common/app_color.dart';
import 'package:expense_tracker/common/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DateInputWidget extends StatelessWidget {
  const DateInputWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.displayText,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final String? displayText;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.08,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: const Color(0xffA1B2C8),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: FaIcon(
                  icon,
                  color: AppColor.whiteColor,
                  size: 15,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  displayText ?? title,
                  style: AppTextStyle.appSubTitle.copyWith(
                    color: AppColor.mainTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
