import 'package:expense_tracker/common/app_color.dart';
import 'package:expense_tracker/common/app_text_style.dart';
import 'package:flutter/cupertino.dart';

class OneTextButton extends StatelessWidget {
  const OneTextButton(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.mediaHeight});
  final String title;
  final double fontSize;
  final double mediaHeight;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: size.width,
        height: size.height * mediaHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyle.appTitle.copyWith(
              color: AppColor.whiteColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
