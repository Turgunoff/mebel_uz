import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mebel_uz/core/domain/entities/product_model.dart';

class FavoritesController extends GetxController {
  final _favoritesBox = Hive.box<String>('favorites');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final favorites = <String>[].obs; // Sevimli mahsulotlarning ID'lari
  final favoriteProducts = <ProductModel>[].obs; // Sevimli mahsulotlar ro'yxati

  // Loading holati
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
    fetchFavoriteProducts();
    everAll(
        [favorites],
        (_) =>
            fetchFavoriteProducts()); // favorites o'zgarganda fetchFavoriteProducts chaqiriladi
  }

  @override
  void onClose() {
    Hive.close(); // Ilovani yopganda Hive'ni yoping
    super.onClose();
  }

  Future<void> fetchFavoriteProducts() async {
    isLoading(true); // Loading holatini true ga o'rnatish

    try {
      final favoriteProductIds = _favoritesBox.values.toList().cast<String>();
      final querySnapshot = await _firestore
          .collection('Products')
          .where(FieldPath.documentId, whereIn: favoriteProductIds)
          .get();

      favoriteProducts.value = querySnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
    } finally {
      isLoading(false); // Loading holatini false ga o'rnatish
    }
  }

  Future<void> addToFavorites(String productId) async {
    favorites.add(productId);
    await _favoritesBox.add(productId);
  }

  Future<void> removeFromFavorites(String productId) async {
    favorites.remove(productId); // Avval favorites listdan o'chiring

    // Hive'dagi barcha qiymatlarni tekshiring va productId ga mos kelganini o'chiring
    for (int i = 0; i < _favoritesBox.length; i++) {
      if (_favoritesBox.getAt(i) == productId) {
        await _favoritesBox.deleteAt(i);
        break; // Topilganidan keyin to'xtating
      }
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
    await fetchFavoriteProducts(); // Sevimlilar ro'yxatini yangilash
  }
}
