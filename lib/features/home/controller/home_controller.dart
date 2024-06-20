import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/core/domain/entities/category_model.dart';
import 'package:mebel_uz/core/domain/entities/product_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observable ro'yxatlar
  final categories = <CategoryModel>[].obs;
  final popularProducts = <ProductModel>[].obs;

  // Loading holati
  final isLoading = true.obs;

  double usdRate = 0; // USD kursi uchun o'zgaruvchi

  @override
  void onInit() async {
    super.onInit();
    fetchCategories();
    fetchPopularProducts();
    usdRate = await getUsdRate();
  }

  Future<double> getUsdRate() async {
    final response = await http
        .get(Uri.parse('https://cbu.uz/oz/arkhiv-kursov-valyut/json/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      for (var item in data) {
        if (item['Ccy'] == 'USD') {
          return double.parse(item['Rate']);
        }
      }
    }
    throw Exception('Failed to load USD rate');
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