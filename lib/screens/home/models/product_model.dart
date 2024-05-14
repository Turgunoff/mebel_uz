class ProductModel {
  final String productId;
  final String productName;
  final String productDesc;
  final double? productPrice;
  final double? productDiscount;
  final List<String>? productColors;
  final List<String> imageUrls;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productDesc,
    required this.productPrice,
    required this.productDiscount,
    required this.productColors,
    required this.imageUrls,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      productDesc: json['productDesc'] as String,
      productPrice: json['productPrice'] as double,
      productDiscount: json['productDiscount'] as double,
      productColors: List<String>.from(json['productColors']) as List<String>?,
      imageUrls: List<String>.from(json['imageUrls']) as List<String>,
    );
  }
}
