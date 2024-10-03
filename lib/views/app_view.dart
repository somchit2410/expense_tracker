import 'package:flutter/material.dart';
import 'package:expense_tracker/common/app_color.dart';
import 'package:expense_tracker/screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Tracker',
      theme: ThemeData(
          colorScheme: ColorScheme.light(
        primary: AppColor.primaryColor,
      )),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
