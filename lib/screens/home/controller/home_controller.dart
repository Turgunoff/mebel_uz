import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';

class HomeController extends GetxController {
  RxList<CategoryModel> categoryList =
      RxList<CategoryModel>([]); // Use an RxList

  @override
  void onInit() {
    super.onInit();
    getCategories(); // Fetch categories on initialization
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
}
