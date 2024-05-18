import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mebel_uz/models/product_model.dart';

class FavoritesController extends GetxController {
  final box = GetStorage('favoritesBox');
  var favorites = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFavorites();
  }

  void saveProduct(ProductModel product) {
    if (favorites.contains(product)) {
      // Agar mahsulot allaqachon sevimlilarda bo'lsa, o'chirish
      box.remove(product.productId.toString());
      favorites.remove(product);
    } else {
      // Aks holda, mahsulotni qo'shish
      box.write(product.productId.toString(), product.toJson());
      favorites.add(product);
    }
    update(); // UI ni yangilash uchun
  }

  void _loadFavorites() {
    favorites.value = getFavorites();
  }

  List<ProductModel> getFavorites() {
    return box.getValues()?.entries.map((entry) {
          return ProductModel.fromJson(entry.value as Map<String, dynamic>);
        }).toList() ??
        [];
  }

  void removeFavorite(int productId) {
    box.remove(productId.toString());
    favorites.removeWhere((p) => p.productId == productId);
    update();
  }

  bool isFavorite(int productId) {
    return _favorites.any((p) => p.productId == productId);
  }
}
