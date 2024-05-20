import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/models/product_model.dart';

class ProductListController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<ProductModel> products = <ProductModel>[].obs;
  RxBool isLoading = true.obs;
  var categoryName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    ever(products, (_) {
      if (products.isNotEmpty) {
        // Faqat ro'yxat bo'sh bo'lmasa
        categoryName.value = products[0].categoryName;
      }
    });
  }

  Future<void> fetchProductsByCategory(String categoryId) async {
    isLoading.value = true;
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('Products')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      final List<ProductModel> fetchedProducts = querySnapshot.docs.map((doc) {
        return ProductModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      products.value = fetchedProducts; // To'g'ri yangilash
      update();
    } catch (e) {
      printError(info: 'Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
