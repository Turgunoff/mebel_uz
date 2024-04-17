import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/models/product_model.dart';

import '../models/category_model.dart';

class HomeController extends GetxController {
  RxList<CategoryModel> categoryList = RxList<CategoryModel>([]);
  RxList<ProductModel> productList = RxList<ProductModel>([]);

  @override
  void onInit() {
    super.onInit();
    getCategories(); // Fetch categories on initialization
    getProducts(); // Fetch products on initialization
  }

  Future<void> getCategories() async {
    CollectionReference categoriesRef =
        FirebaseFirestore.instance.collection('Categories');

    QuerySnapshot querySnapshot = await categoriesRef.get();
    List<CategoryModel> newList = querySnapshot.docs
        .map((doc) => CategoryModel.fromJson(doc.data()))
        .toList();

    categoryList.value = newList; // Update the observable list
  }

  //get products
  Future<void> getProducts() async {
    CollectionReference productsRef =
        FirebaseFirestore.instance.collection('Products');

    QuerySnapshot querySnapshot = await productsRef.get();
    List<ProductModel> productModel = querySnapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data()))
        .toList();

    productList.value = productModel; // Update the observable list
  }
}
