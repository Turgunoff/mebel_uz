import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/models/product_model.dart';

class ProductDetailsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Rx<ProductModel?> product = Rx<ProductModel?>(null);

  RxBool isLoading = true.obs;

  void fetchProductDetails(String productId) async {
    // Parametr turini String ga o'zgartiring
    isLoading.value = true; // Loading holatini true ga o'rnatamiz
    try {
      final documentSnapshot = await _firestore
          .collection('Products')
          .doc(productId) // Endi String tipida ishlatamiz
          .get();

      if (documentSnapshot.exists) {
        product.value = ProductModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>);
      } else {
        product.value = null;
      }
    } catch (e) {
      print('Error fetching product details: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
