import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mebel_uz/models/product_hive_model.dart';
import 'package:mebel_uz/models/product_model.dart';

class FavoritesController extends GetxController {
  final _favoritesBox = Hive.box<ProductHiveModel>('favorites');
  final _favorites = <ProductHiveModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFavorites();
  }

  List<ProductHiveModel> get favorites => _favorites.toList();

  void toggleFavorite(ProductModel product) {
    try {
      final productHiveModel = ProductHiveModel.fromProductModel(product);
      final existingIndex =
          _favorites.indexWhere((p) => p.productId == product.productId);

      if (existingIndex != -1) {
        _favoritesBox.deleteAt(existingIndex); // Index bo'yicha o'chirish
        _favorites.removeAt(existingIndex);
      } else {
        _favoritesBox.add(productHiveModel);
        _favorites.add(productHiveModel);
      }
    } catch (e) {
      Get.snackbar(
        "Xatolik",
        "Sevimlilar ro'yxatini yangilashda xatolik yuz berdi.",
        snackPosition: SnackPosition.BOTTOM,
      );
      printError(info: 'Error in toggleFavorite: $e');
    }
    update();
  }

  bool isFavorite(ProductModel product) {
    return _favorites.any((p) => p.productId == product.productId);
  }

  void _loadFavorites() {
    try {
      _favorites.value = _favoritesBox.values.toList();
    } catch (e) {
      printError(info: 'Error loading favorites: $e');
    }
  }
}
