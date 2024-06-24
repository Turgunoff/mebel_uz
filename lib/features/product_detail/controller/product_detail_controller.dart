import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/core/domain/entities/product_model.dart';

class ProductDetailController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final isLoading = true.obs;

  // Rx o'zgaruvchisini RxBool ga o'zgartiramiz va boshlang'ich qiymat false bo'ladi
  final productExists = false.obs;

  // product ni Rx<ProductModel> dan ProductModel ga o'zgartiramiz
  ProductModel? product;

  RxBool isSwitch = false.obs;
  RxBool showMoreDetails = false.obs;

  // Mahsulot ma'lumotlarini olish
  Future<void> getProductDetails(String productId) async {
    isLoading.value = true; // Loading holatini true ga o'rnatish
    try {
      final docSnapshot =
          await _firestore.collection('Products').doc(productId).get();

      if (docSnapshot.exists) {
        product = ProductModel.fromJson(docSnapshot.data()!);
        productExists.value =
            true; // Mahsulot mavjud bo'lsa true qiymatini o'rnatish
      } else {
        // Mahsulot topilmasa, xatolikni qayta ishlash (snackbar yoki dialog ko'rsatish)
        handleError('Mahsulot topilmadi');
      }
    } catch (e) {
      // Xatolikni qayta ishlash
      handleError('Xatolik yuz berdi');
    } finally {
      isLoading.value = false; // Loading holatini false ga o'rnatish
    }
  }

  void handleError(String errorMessage) {
    Get.snackbar('Xatolik', errorMessage);
    // Yoki Get.defaultDialog() orqali dialog oynasi ko'rsatish
  }
}
