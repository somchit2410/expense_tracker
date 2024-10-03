import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expense_tracker/common/app_color.dart';
import 'package:expense_tracker/common/app_text_style.dart';
import 'package:expense_tracker/common_widgets/icon_button_widget.dart';
import 'package:expense_tracker/common_widgets/stat_card_widget.dart';
import 'package:expense_tracker/common_widgets/transaction_tile.dart';
import 'package:expense_tracker/data/data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Profile image
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.tertiaryColor,
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.user,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Welcome text and name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome!", style: AppTextStyle.appSubTitle),
                        Text(
                          "Somchit Khanthavong",
                          style: AppTextStyle.appTitle,
                        ),
                      ],
                    ),
                  ],
                ),

                // Settings button
                const CustomIconButton(
                  buttonIcon: FaIcon(FontAwesomeIcons.gear),
                ),
              ],
            ),

            // Card
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: size.width,
              height: size.width / 2,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(35),
                color: AppColor.primaryColor,
                // Adding shadow here
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.2), // Shadow color with opacity
                    spreadRadius: 2, // Spread of the shadow
                    blurRadius: 30, // Blur radius for the shadow
                    offset: const Offset(0, 10), // Offset for shadow position
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Total balance title and total balance value
                  Column(
                    children: [
                      Text(
                        "Total Balance",
                        style: AppTextStyle.appSubTitle.copyWith(
                          color: AppColor.bgColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "₭ 10,600,000",
                        style: AppTextStyle.appTitle.copyWith(
                          color: AppColor.whiteColor,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),

                  // income and expense
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatCardWidget(
                        icon: FontAwesomeIcons.arrowDown,
                        upperText: "Income",
                        lowerText: "5,500,000",
                        iconColor: AppColor.incomeColor,
                      ),
                      StatCardWidget(
                        icon: FontAwesomeIcons.arrowUp,
                        upperText: "Expense",
                        lowerText: "1,700,000",
                        iconColor: AppColor.expenseColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Transaction title and view all button
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions",
                  style: AppTextStyle.appTitle,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: AppTextStyle.appSubTitle.copyWith(
                      color: AppColor.mainTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Transaction list
            Expanded(
              child: ListView.builder(
                itemCount: transactionData.length,
                itemBuilder: (context, int i) {
                  return Column(
                    children: [
                      TransactionTile(
                        icon: transactionData[i]['icon'],
                        circleColor: transactionData[i]['circleColor'],
                        type: transactionData[i]['type'],
                        amount: transactionData[i]['amount'],
                        date: transactionData[i]['date'],
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
