class CategoryEntity {
  String categoryId;
  String name;
  int totalExpense;
  String icon;
  String color;

  CategoryEntity({
    required this.categoryId,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color,
  });

  /// Converts this [CategoryEntity] into a document that can be stored in a Firestore database.
  ///
  /// This is used when we need to convert this class to a
  /// document so that it can be stored in the database.
  Map<String, Object?> toDocument() {
    return {
      'categoryId': categoryId,
      'name': name,
      'totalExpense': totalExpense,
      'icon': icon,
      'color': color,
    };
  }

  /// Converts a document from a Firestore database into a [CategoryEntity].
  ///
  /// This is used when we need to convert a document from the
  /// database into a [CategoryEntity] so that it can be used in the
  /// user interface.
  static CategoryEntity fromDocument(Map<String, Object?> document) {
    return CategoryEntity(
      categoryId: document['categoryId'] as String,
      name: document['name'] as String,
      totalExpense: document['totalExpense'] as int,
      icon: document['icon'] as String,
      color: document['color'] as String,
    );
  }
}
