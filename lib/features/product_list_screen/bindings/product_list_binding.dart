import 'package:get/get.dart';

import '../controller/product_list_controller.dart';

class ProductListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(() => ProductListController(),
        fenix: true);
  }
}
