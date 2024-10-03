import 'package:expense_tracker/common/app_color.dart';
import 'package:expense_tracker/common/app_text_style.dart';
import 'package:expense_tracker/common_widgets/info_input_widget.dart';
import 'package:expense_tracker/common_widgets/one_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  DateTime? _selectedDate; // Track selected date
  final TextEditingController _expenseController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  // Function to handle date picking
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const FaIcon(FontAwesomeIcons.xmark),
                    color: AppColor.subTextColor,
                  ),
                ),

                SizedBox(height: size.height * 0.06),

                // amount input
                Column(
                  children: [
                    Text(
                      'Add Expenses',
                      style: AppTextStyle.appTitle.copyWith(
                          color: AppColor.mainTextColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),

                    // input field
                    SizedBox(
                      width: size.width * 0.75,
                      child: TextFormField(
                        controller: _expenseController,
                        textAlign: TextAlign.center,
                        keyboardType:
                            TextInputType.number, // Set keyboard type to number
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter
                              .digitsOnly, // Allow only digits
                        ],
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColor.whiteColor,
                          hintText: '0',
                          hintStyle: TextStyle(
                              color: AppColor.mainTextColor, fontSize: 30),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColor.mainTextColor,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                // Category input
                InfoInputWidget(
                  title: 'Category',
                  isCategory: true,
                  icon: FontAwesomeIcons.listCheck,
                  isInputField: true, // Enable text input
                  controller: _categoryController, // Assign text controller
                ),
                const SizedBox(height: 20),

                // note input
                InfoInputWidget(
                  title: 'Note',
                  icon: FontAwesomeIcons.noteSticky,
                  isInputField: true, // Enable text input
                  controller: _noteController, // Assign text controller
                ),
                const SizedBox(height: 20),

                // Date input with date picker
                InfoInputWidget(
                  title: 'Date',
                  icon: FontAwesomeIcons.calendarDays,
                  displayText: _selectedDate != null
                      ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                      : 'Select Date', // Show selected date or default text
                  onTap: () => _selectDate(context), // Open date picker on tap
                ),

                SizedBox(height: size.height * 0.2),

                // Save button for add expense
                const OneTextButton(
                  title: 'SAVE',
                  mediaHeight: 0.07,
                  fontSize: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
