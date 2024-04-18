class ProductModel {
  final String productId;
  final String productName;
  final String productDescription;
  final int productPrice;
  final int productRating;
  final String productCategory;
  final List<String>? productImages;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productRating,
    required this.productCategory,
    required this.productImages,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      productId: json['productId'],
      productName: json['productName'],
      productDescription: json['productDescription'],
      productPrice: json['productPrice'],
      productRating: json['productRating'],
      productCategory: json['productCategory'],
      productImages: json['productImages'] != null
          ? List<String>.from(json['productImages'])
          : null,
    );
  }
}
