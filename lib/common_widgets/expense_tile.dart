import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expense_tracker/common/app_color.dart';
import 'package:expense_tracker/common/app_text_style.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile(
      {super.key,
      required this.type,
      required this.amount,
      required this.icon,
      required this.circleColor});

  final String type;
  final String amount;

  final FaIcon icon;
  final Color circleColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      width: size.width,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: circleColor,
                ),
                child: Center(child: icon),
              ),
              const SizedBox(width: 15),
              Text(
                type,
                style: AppTextStyle.appTitle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: AppTextStyle.appTitle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColor.titleTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
