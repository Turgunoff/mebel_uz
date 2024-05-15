import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/screens/home/models/category_model.dart';
import 'package:mebel_uz/models/product_model.dart';

class HomeController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final RxList<ProductModel> popularProducts = <ProductModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchPopularProducts();
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;
    CollectionReference categoriesRef = _firestore.collection('Categories');

    QuerySnapshot querySnapshot = await categoriesRef.get();
    List<CategoryModel> newList = querySnapshot.docs.map((doc) {
      if (doc.data() is Map<String, dynamic>) {
        return CategoryModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        // Handle unexpected situations here
        throw Exception('Document data is not a Map');
      }
    }).toList();
    categories.value = newList; // Update the observable list
    isLoading.value = false; // Set loading to false when data is fetched
  }

  Future<void> fetchPopularProducts() async {
    CollectionReference productsRef = _firestore.collection('Products');

    QuerySnapshot querySnapshot = await productsRef.get();
    List<ProductModel> newList = querySnapshot.docs.map((doc) {
      if (doc.data() is Map<String, dynamic>) {
        return ProductModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        // Handle unexpected situations here
        throw Exception('Document data is not a Map');
      }
    }).toList();
    popularProducts.value = newList; // Update the observable list
  }
}
