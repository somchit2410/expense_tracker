import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryInputWidget extends StatelessWidget {
  const CategoryInputWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onCategorySelected,
    required this.selectedCategory,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function(String?) onCategorySelected;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Food',
      'Transport',
      'Entertainment',
      'Utilities'
    ]; // Example categories

    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(icon),
          ),
          Expanded(
            child: DropdownButton<String>(
              value: selectedCategory.isNotEmpty ? selectedCategory : null,
              hint: Text(title),
              onChanged: (String? newValue) {
                onCategorySelected(newValue);
              },
              items:
                  categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
