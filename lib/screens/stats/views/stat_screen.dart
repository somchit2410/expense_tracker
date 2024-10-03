import 'package:expense_tracker/common_widgets/expense_tile.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expense_tracker/common/app_color.dart';
import 'package:expense_tracker/common/app_text_style.dart';
import 'package:expense_tracker/common_widgets/icon_button_widget.dart';
import 'package:expense_tracker/screens/stats/views/chart.dart';

class StatScreen extends StatefulWidget {
  const StatScreen({super.key});

  @override
  State<StatScreen> createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  bool isExpenseSelected = true; // Track which section is selected
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
        child: Column(
          children: [
            // top section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CustomIconButton(
                      buttonIcon: FaIcon(FontAwesomeIcons.circleArrowLeft),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Transactions',
                      style: AppTextStyle.appTitle.copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const CustomIconButton(
                  buttonIcon: FaIcon(FontAwesomeIcons.sliders),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // income and expense button section
            Container(
              width: size.width,
              height: size.height * 0.08,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpenseSelected = false; // Select Income
                        });
                      },
                      child: Container(
                        width: size.width * 0.417,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          color: isExpenseSelected
                              ? AppColor.whiteColor
                              : AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Income',
                            style: AppTextStyle.appTitle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: isExpenseSelected
                                  ? AppColor.mainTextColor
                                  : AppColor.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpenseSelected = true; // Select Expense
                        });
                      },
                      child: Container(
                        width: size.width * 0.417,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          color: isExpenseSelected
                              ? AppColor.primaryColor
                              : AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Expense',
                            style: AppTextStyle.appTitle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: isExpenseSelected
                                    ? AppColor.whiteColor
                                    : AppColor.mainTextColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // total amount and date
            Container(
                width: size.width,
                height: size.height * 0.09,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '01 Mar 2023 - 31 Mar 2023',
                        style: AppTextStyle.appTitle.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '₭ 8,500,000',
                        style: AppTextStyle.appTitle.copyWith(
                          fontSize: 25,
                          color: AppColor.mainTextColor,
                        ),
                      )
                    ],
                  ),
                )),

            // chart display
            Container(
              width: size.width,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: MyChart(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sat, 01 Mar 2023',
                  style: AppTextStyle.appTitle.copyWith(
                    fontSize: 20,
                    color: AppColor.mainTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '-1,000,000',
                  style: AppTextStyle.appTitle.copyWith(
                      fontSize: 20,
                      color: AppColor.subTextColor,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Transaction list
            Expanded(
              child: ListView.builder(
                itemCount: expenseData.length,
                itemBuilder: (context, int i) {
                  return Column(
                    children: [
                      ExpenseTile(
                        icon: expenseData[i]['icon'],
                        circleColor: expenseData[i]['circleColor'],
                        type: expenseData[i]['type'],
                        amount: expenseData[i]['amount'],
                      ),
                      const SizedBox(height: 15),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
