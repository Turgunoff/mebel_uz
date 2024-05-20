import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mebel_uz/models/product_model.dart';

class FavoritesController extends GetxController {
  final box = GetStorage('favoritesBox');
  final _favorites = <ProductModel>[].obs;

  List<ProductModel> get favorites => _favorites.toList();

  @override
  void onInit() {
    super.onInit();
    _loadFavorites();
  }

  void toggleFavorite(ProductModel product) {
    if (isFavorite(product.productId)) {
      removeFavorite(product.productId);
    } else {
      box.write(product.productId, product.toJson());
      _favorites.add(product);
    }
    update();
  }

  void _loadFavorites() {
    List<dynamic> favoritesData = box.read('favorites') ?? [];
    _favorites.value = favoritesData
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();
  }

  void removeFavorite(String productId) {
    box.remove(productId.toString());
    _favorites.removeWhere((p) => p.productId == productId);
    update();
  }

  bool isFavorite(String productId) {
    return _favorites.any((p) => p.productId == productId);
  }
}
