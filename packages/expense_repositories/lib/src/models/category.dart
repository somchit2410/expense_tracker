import 'package:expense_repositories/src/entities/category_entity.dart';

class Category {
  String categoryId;
  String name;
  int totalExpense;
  String icon;
  String color;

  Category({
    required this.categoryId,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color,
  });

  /// A default empty category that can be used as a placeholder.
  ///
  /// This is useful when we need to create a new category and
  /// we don't have any data yet.
  static final empty = Category(
    categoryId: '',
    name: '',
    totalExpense: 0,
    icon: '',
    color: '',
  );

  /// Converts this [Category] to a [CategoryEntity].
  ///
  /// This is used when we need to convert this class to a
  /// [CategoryEntity] so that it can be stored in the database.
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpense: totalExpense,
      icon: icon,
      color: color,
    );
  }

  /// Converts a [CategoryEntity] to a [Category].
  ///
  /// This is used when we need to convert a [CategoryEntity] to a
  /// [Category] so that it can be used in the user interface.
  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpense: entity.totalExpense,
      icon: entity.icon,
      color: entity.color,
    );
  }
}
