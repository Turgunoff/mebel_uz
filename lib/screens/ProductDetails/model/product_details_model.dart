class ProductDetailsModel {
  final String productId;
  final String productName;
  final String productDesc;
  final double productPrice;
  final double productDiscount;
  final List<String> productColors;
  final List<String> imageUrls;
  // final List<ReviewModel> reviews; // Sharhlar uchun model

  ProductDetailsModel({
    required this.productId,
    required this.productName,
    required this.productDesc,
    required this.productPrice,
    required this.productDiscount,
    required this.productColors,
    required this.imageUrls,
    // required this.reviews,
  });
}
