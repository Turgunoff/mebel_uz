import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesController extends GetxController {
  final _favoritesBox = Hive.box<String>('favorites');

  final favorites = <String>[].obs; // Sevimli mahsulotlarning ID'lari

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  @override
  void onClose() {
    Hive.close(); // Ilovani yopganda Hive'ni yoping
    super.onClose();
  }

  Future<void> addToFavorites(String productId) async {
    favorites.add(productId);
    await _favoritesBox.add(productId);
  }

  Future<void> removeFromFavorites(String productId) async {
    final index = favorites.indexOf(productId);
    if (index != -1) {
      favorites.removeAt(index);
      await _favoritesBox.deleteAt(index); // Boxdan o'chirish
    }
  }

  void loadFavorites() {
    favorites.value = _favoritesBox.values.toList().cast<String>();
  }

  // isFavorite()
  bool isFavorite(String productId) {
    return favorites.contains(productId);
  }

  Future<void> toggleFavorite(productId) async {
    if (isFavorite(productId)) {
      await removeFromFavorites(productId);
    } else {
      await addToFavorites(productId);
    }
  }
}
