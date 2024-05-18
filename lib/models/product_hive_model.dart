import 'package:hive/hive.dart';
import 'package:mebel_uz/models/product_model.dart';

part 'product_hive_model.g.dart'; // Adapter generatsiyasi uchun

@HiveType(typeId: 0) // TypeAdapter uchun noyob ID
class ProductHiveModel extends HiveObject {
  @HiveField(0)
  late String productId;
  @HiveField(1)
  late String productName;
  @HiveField(2)
  late String productDesc;
  @HiveField(3)
  late double? productPrice;
  @HiveField(4)
  late double? productDiscount;
  @HiveField(5)
  late List<String>? productColors;
  @HiveField(6)
  late List<String> imageUrls;

  ProductHiveModel({
    required this.productId,
    required this.productName,
    required this.productDesc,
    required this.productPrice,
    required this.productDiscount,
    required this.productColors,
    required this.imageUrls,
  });

  ProductHiveModel.fromProductModel(ProductModel productModel) {
    productId = productModel.productId;
    productName = productModel.productName;
    productDesc = productModel.productDesc;
    productPrice = productModel.productPrice;
    productDiscount = productModel.productDiscount;
    productColors = productModel.productColors;
    imageUrls = productModel.imageUrls;
  }
}
