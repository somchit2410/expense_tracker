import 'package:flutter/cupertino.dart';
import 'package:expense_tracker/common/app_color.dart';
import 'package:expense_tracker/common/app_text_style.dart';

class StatCardWidget extends StatelessWidget {
  const StatCardWidget(
      {super.key,
      required this.icon,
      required this.upperText,
      required this.lowerText,
      required this.iconColor});
  final IconData icon;
  final Color iconColor;
  final String upperText;
  final String lowerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Circle and Icon
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.subTextColor.withOpacity(0.5),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 10),

        // upper text and lower text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              upperText,
              style: AppTextStyle.appSubTitle.copyWith(
                  color: AppColor.bgColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            Text(
              lowerText,
              style: AppTextStyle.appTitle.copyWith(
                color: AppColor.whiteColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
