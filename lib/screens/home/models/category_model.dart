class CategoryModel {
  final String? categoryId;
  final String categoryNameUz;
  final String categoryNameRu;
  final String categoryImage;
  final bool isVisibility;

  CategoryModel({
    required this.categoryId,
    required this.categoryNameUz,
    required this.categoryNameRu,
    required this.categoryImage,
    required this.isVisibility,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'] as String?,
      categoryNameUz: json['categoryNameUz'] as String,
      categoryNameRu: json['categoryNameRu'] as String,
      categoryImage: json['categoryImage'] as String,
      isVisibility: json['isVisibility'] as bool,
    );
  }
}
