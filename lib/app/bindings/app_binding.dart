import 'package:get/get.dart';
import 'package:mebel_uz/features/favorites/controller/favorites_controller.dart';
import 'package:mebel_uz/features/home/controller/home_controller.dart';

import '../../features/categories/controller/categories_controller.dart';
import '../../features/product_list_screen/controller/product_list_controller.dart';

class AppControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<FavoritesController>(() => FavoritesController(), fenix: true);
    Get.lazyPut<CategoriesController>(() => CategoriesController(),
        fenix: true);
    Get.lazyPut<ProductListController>(() => ProductListController(),
        fenix: true);
  }
}
