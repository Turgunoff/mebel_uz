class ProductModel {
  final String productId;
  final String productName;
  final String productDesc;
  final double? productPrice;
  final double? productDiscount;
  final List<String>? productColors;
  final List<String> imageUrls;
  final String categoryName;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productDesc,
    required this.productPrice,
    required this.productDiscount,
    required this.productColors,
    required this.imageUrls,
    required this.categoryName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      productDesc: json['productDesc'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productDiscount: (json['productDiscount'] as num).toDouble(),
      productColors: List<String>.from(json['productColors']) as List<String>?,
      imageUrls: List<String>.from(json['imageUrls']),
      categoryName: json['categoryName'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        'productId': productId,
        'productName': productName,
        'productDesc': productDesc,
        'productPrice': productPrice,
        'productDiscount': productDiscount,
        'productColors': productColors,
        'imageUrls': imageUrls,
        'categoryName': categoryName,
      };
}
