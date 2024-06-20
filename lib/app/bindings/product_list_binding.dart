import 'package:get/get.dart';

import '../../features/product_list_screen/controller/product_list_controller.dart';

class ProductListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(() => ProductListController());
  }
}
