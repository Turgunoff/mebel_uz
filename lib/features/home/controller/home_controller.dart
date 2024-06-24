import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/core/domain/entities/category_model.dart';
import 'package:mebel_uz/core/domain/entities/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:mebel_uz/core/domain/entities/discounts_model.dart';

import '../../../core/presentation/routes/app_routes.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observable ro'yxatlar
  final popularCategories = <CategoryModel>[].obs;
  final popularProducts = <ProductModel>[].obs;
  final discounts = <DiscountsModel>[].obs;

  final _carouselIndex = 0.obs;

  // Loading holati
  final isLoading = true.obs;

  double usdRate = 0;

  @override
  void onInit() async {
    super.onInit();
    fetchPopularCategories();
    fetchPopularProducts();
    fetchDiscounts();
    usdRate = await getUsdRate();
  }

  int get carouselIndex => _carouselIndex.value;

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    // Slayder indeksi o'zgarganda chaqiriladi
    _carouselIndex.value = index;
  }

  // Carousel uchun reklamalarni olish
  Future<void> fetchDiscounts() async {
    isLoading.value = true;

    try {
      final querySnapshot = await _firestore.collection('Discounts').get();
      discounts.value = querySnapshot.docs
          .map((doc) => DiscountsModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      // Xatolikni qayta ishlash (loglash, foydalanuvchiga xabar berish)
      printError(info: 'Error fetching categories: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Joriy usd kursini olish
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
  Future<void> fetchPopularCategories() async {
    isLoading.value = true; // Loading holatini true ga o'rnatish
    try {
      final querySnapshot = await _firestore
          .collection('Categories')
          .orderBy(
              'order') // order maydoni bo'yicha o'sish tartibida tartiblash
          .get();
      popularCategories.value = querySnapshot.docs
          .map((doc) => CategoryModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      // Xatolikni qayta ishlash (snackbar yoki dialog ko'rsatish)
      printError(info: 'Error fetching categories: $e');
    } finally {
      isLoading.value = false; // Loading holatini false ga o'rnatish
    }
  }

  // Mashhur mahsulotlarni olish
  Future<void> fetchPopularProducts() async {
    // Ommabop mahsulotlarni Firestore'dan yuklash
    try {
      final snapshot = await _firestore
          .collection('Products')
          .where('productDiscount',
              isGreaterThan: 0) // Faqat chegirmali mahsulotlar
          .orderBy('productDiscount',
              descending:
                  true) // Chegirma foizi bo'yicha kamayish tartibida saralash
          .get();

      popularProducts.value = snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Mahsulotlarni yuklashda xatolik: $e');
    } finally {
      isLoading.value = false; // Yuklash tugashi haqida xabar berish
    }
  }

  void navigateToProductDetails(String productId) {
    Get.toNamed(AppRoutes.PRODUCT_DETAIL, arguments: productId);
  }
}
