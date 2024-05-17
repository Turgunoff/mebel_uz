import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/screens/home/models/category_model.dart';
import 'package:mebel_uz/models/product_model.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observable ro'yxatlar
  final categories = <CategoryModel>[].obs;
  final popularProducts = <ProductModel>[].obs;

  // Loading holati
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchPopularProducts();
  }

  // Kategoriyalarni olish
  Future<void> fetchCategories() async {
    isLoading.value = true;

    try {
      final querySnapshot = await _firestore.collection('Categories').get();
      categories.value = querySnapshot.docs
          .map((doc) => CategoryModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      // Xatolikni qayta ishlash (loglash, foydalanuvchiga xabar berish)
      printError(info: 'Error fetching categories: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Mashhur mahsulotlarni olish
  Future<void> fetchPopularProducts() async {
    try {
      final querySnapshot = await _firestore.collection('Products').get();
      popularProducts.value = querySnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      // Xatolikni qayta ishlash (loglash, foydalanuvchiga xabar berish)
      printError(info: 'Error fetching popular products: $e');
    }
  }
}
