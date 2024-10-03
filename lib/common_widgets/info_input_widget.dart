import 'package:expense_tracker/common/app_color.dart';
import 'package:expense_tracker/common/app_text_style.dart';
import 'package:expense_tracker/common_widgets/one_text_button.dart';
import 'package:expense_tracker/data/icon_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoInputWidget extends StatefulWidget {
  const InfoInputWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap, // Optional tap handler (for date picker, etc.)
    this.displayText, // Display the selected date or text
    this.isInputField = false, // New: to handle whether it's an input field
    this.controller, // New: text controller for input
    this.isCategory = false,
  });

  final String title;
  final IconData icon;
  final VoidCallback?
      onTap; // Function to be called on tap (used for date picker)
  final String? displayText; // Text to display instead of a static title
  final bool
      isInputField; // New: to differentiate between text input and other types
  final TextEditingController? controller; // New: to control text input
  final bool isCategory;

  @override
  State<InfoInputWidget> createState() => _InfoInputWidgetState();
}

class _InfoInputWidgetState extends State<InfoInputWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap, // Handle tap action (e.g., opening date picker)
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
                  widget.icon,
                  color: AppColor.whiteColor,
                  size: 15,
                ),
              ),
              const SizedBox(width: 20),

              // If it's an input field, show the TextField, otherwise show static text
              Expanded(
                child: widget.isInputField
                    ? TextFormField(
                        onTap: () {
                          print('Input field tapped');
                        },
                        controller: widget.controller,
                        readOnly: widget.isCategory == true ? true : false,
                        decoration: InputDecoration(
                          suffixIcon: widget.isCategory == true
                              ? IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        bool isExpanded =
                                            false; // expanded icon input state
                                        String iconSelected = '';
                                        Color pickColor = AppColor.whiteColor;

                                        // StatefulBuilder is used to create a stateful widget for the dialog
                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            return AlertDialog(
                                              title: Text(
                                                'Create a new category',
                                                style: TextStyle(
                                                  color: AppColor.mainTextColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              backgroundColor:
                                                  AppColor.subTextColor,
                                              content: SizedBox(
                                                width: size.width,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    // name
                                                    TextFormField(
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        filled: true,
                                                        fillColor:
                                                            AppColor.whiteColor,
                                                        hintText: 'Name',
                                                        hintStyle: TextStyle(
                                                            color: AppColor
                                                                .mainTextColor),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            10,
                                                          ),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                      ),
                                                    ),

                                                    const SizedBox(height: 10),

                                                    // icon
                                                    TextFormField(
                                                      onTap: () {
                                                        // Set the state to expanded when the icon is tapped
                                                        setState(() {
                                                          isExpanded =
                                                              !isExpanded;
                                                        });
                                                      },
                                                      readOnly: true,
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        filled: true,
                                                        fillColor:
                                                            AppColor.whiteColor,
                                                        suffixIcon: Icon(
                                                          CupertinoIcons
                                                              .chevron_down,
                                                          color: AppColor
                                                              .mainTextColor,
                                                          size: 14,
                                                        ),
                                                        hintText: 'Icon',
                                                        hintStyle: TextStyle(
                                                            color: AppColor
                                                                .mainTextColor),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              isExpanded
                                                                  ? const BorderRadius
                                                                      .vertical(
                                                                      top: Radius
                                                                          .circular(
                                                                              10),
                                                                    )
                                                                  : BorderRadius
                                                                      .circular(
                                                                      10,
                                                                    ),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                      ),
                                                    ),

                                                    // set radius of icon if expanded
                                                    isExpanded
                                                        ? Container(
                                                            width: size.width,
                                                            height: 150,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColor
                                                                  .whiteColor,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .vertical(
                                                                bottom: Radius
                                                                    .circular(
                                                                        10),
                                                              ),
                                                            ),

                                                            // grid view for icons to select
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: GridView
                                                                  .builder(
                                                                gridDelegate:
                                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      4,
                                                                  mainAxisSpacing:
                                                                      5,
                                                                  crossAxisSpacing:
                                                                      5,
                                                                ),
                                                                itemCount:
                                                                    categoriesIcons
                                                                        .length,
                                                                itemBuilder: (context,
                                                                        int index) =>
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      iconSelected =
                                                                          categoriesIcons[
                                                                              index];
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        width:
                                                                            2,
                                                                        color: iconSelected ==
                                                                                categoriesIcons[index]
                                                                            ? AppColor.incomeColor
                                                                            : AppColor.subTextColor,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      image:
                                                                          DecorationImage(
                                                                        image:
                                                                            AssetImage(
                                                                          'assets/${categoriesIcons[index]}.png',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        : Container(),

                                                    const SizedBox(height: 10),

                                                    // colors
                                                    TextFormField(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (builder) {
                                                            return AlertDialog(
                                                              content:
                                                                  GestureDetector(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    ColorPicker(
                                                                      pickerColor:
                                                                          pickColor,
                                                                      onColorChanged:
                                                                          (color) {
                                                                        setState(
                                                                          () {
                                                                            pickColor =
                                                                                color;
                                                                          },
                                                                        );
                                                                      },
                                                                    ),

                                                                    // Save button for color picker
                                                                    const OneTextButton(
                                                                      title:
                                                                          'SAVE',
                                                                      mediaHeight:
                                                                          0.05,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      readOnly: true,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        filled: true,
                                                        fillColor: pickColor,
                                                        hintText: 'Color',
                                                        hintStyle: TextStyle(
                                                          color: AppColor
                                                              .mainTextColor,
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            10,
                                                          ),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                      ),
                                                    ),

                                                    const SizedBox(height: 15),
                                                    // Save button for new category
                                                    const OneTextButton(
                                                      title: 'SAVE',
                                                      mediaHeight: 0.05,
                                                      fontSize: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.plus,
                                    size: 14,
                                    color: AppColor.mainTextColor,
                                  ),
                                )
                              : null,
                          hintText: widget.title,
                          hintStyle: TextStyle(
                            color: AppColor.mainTextColor,
                          ), // Hint text for input
                          border: InputBorder.none, // Remove borders
                        ),
                        style: AppTextStyle.appSubTitle.copyWith(
                          color: AppColor.mainTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : Text(
                        widget.displayText ??
                            widget.title, // Display text or title
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
