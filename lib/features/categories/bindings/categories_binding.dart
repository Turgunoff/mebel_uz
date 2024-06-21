import 'package:get/get.dart';
import 'package:mebel_uz/features/categories/controller/categories_controller.dart';

class CategoriesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(() => CategoriesController(),
        fenix: true);
  }
}
