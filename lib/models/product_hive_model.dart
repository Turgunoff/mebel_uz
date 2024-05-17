import 'package:hive/hive.dart';

part 'product_hive_model.g.dart'; // Adapter generatsiyasi uchun

@HiveType(typeId: 0) // TypeAdapter uchun noyob ID
class ProductHiveModel extends HiveObject {
  @HiveField(0)
  final String productId;
  @HiveField(1)
  final String productName;
  @HiveField(2)
  final String productDesc;
  @HiveField(3)
  final double? productPrice;
  @HiveField(4)
  final double? productDiscount;
  @HiveField(5)
  final List<String>? productColors;
  @HiveField(6)
  final List<String> imageUrls;

  ProductHiveModel({
    required this.productId,
    required this.productName,
    required this.productDesc,
    required this.productPrice,
    required this.productDiscount,
    required this.productColors,
    required this.imageUrls,
  });
}
