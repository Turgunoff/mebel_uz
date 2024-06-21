import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final favorites = <String>[].obs;
  String? _deviceId;

  @override
  void onInit() async {
    super.onInit();
    await _getDeviceId(); // Qurilma ID'sini olish
    loadFavorites(); // Sevimlilarni yuklash
  }

  Future<void> _getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    _deviceId = androidInfo.id; // Android qurilma ID'si
  }

  Future<void> addToFavorites(String productId) async {
    if (_deviceId != null) {
      try {
        final favoritesRef = _firestore.collection('favorites').doc(_deviceId);
        final docSnapshot = await favoritesRef.get();
        if (docSnapshot.exists) {
          await favoritesRef.update({
            'products': FieldValue.arrayUnion([productId]),
          });
        } else {
          await favoritesRef.set({
            'products': [productId],
          });
        }
        favorites.add(productId);
      } catch (e) {
        handleError(e);
      }
    }
  }

  Future<void> removeFromFavorites(String productId) async {
    if (_deviceId != null) {
      try {
        await _firestore.collection('favorites').doc(_deviceId).update({
          'products': FieldValue.arrayRemove([productId]),
        });
        favorites.remove(productId);
      } catch (e) {
        handleError(e);
      }
    }
  }

  Future<void> loadFavorites() async {
    if (_deviceId != null) {
      try {
        final docSnapshot =
            await _firestore.collection('favorites').doc(_deviceId).get();
        if (docSnapshot.exists) {
          final data = docSnapshot.data() as Map<String, dynamic>;
          favorites.value = List<String>.from(data['products'] ?? []);
        }
      } catch (e) {
        handleError(e);
      }
    }
  }

  void handleError(error) {
    Get.snackbar('Xatolik', error.toString());
  }
}
