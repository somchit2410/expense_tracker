import 'package:expense_tracker/screens/add_expense/views/add_expense_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expense_tracker/common/app_color.dart';
import 'package:expense_tracker/screens/home/views/main_screen.dart';
import 'package:expense_tracker/screens/stats/views/stat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var widgetList = [const MainScreen(), const StatScreen()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      // ClipRRect is used to make bottom navigation bar rounded
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        // BottomNavigationBar is used to create bottom navigation bar
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: AppColor.whiteColor,
          showUnselectedLabels: false,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: AppColor.subTextColor,
          showSelectedLabels: false,
          elevation: 3,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_grid_2x2_fill),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.chartSimple),
              label: 'Stat',
            ),
          ],
        ),
      ),

      body: index == 0 ? const MainScreen() : const StatScreen(),

      // FloatingActionButton is used to create floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddExpenseScreen()));
        },
        shape: const CircleBorder(),
        child: const FaIcon(FontAwesomeIcons.plus),
      ),

      // floatingActionButtonLocation is used to set the location of the floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
