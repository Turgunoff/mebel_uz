import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../models/product_model.dart';
import '../models/category_model.dart';

class HomeController extends GetxController {
  List<ProductModel> productList = [];
  Rx<List<CategoryModel>> categoryList = Rx<List<CategoryModel>>([]);

  @override
  void onInit() {
    super.onInit();
    categoryList.bindStream(getCategories());
    // getCategories();
  }

  Stream<List<CategoryModel>> getCategories() {
    return FirebaseFirestore.instance
        .collection('Categories')
        .snapshots()
        .map((query) => query.docs
            .map((item) => CategoryModel.fromJson(item.data()))
            .toList())
        .handleError((error) => print('Error: ${error}'));
  }
}
