//home bindings

import 'package:get/get.dart';
import 'package:mebel_uz/features/favorite/controller/controller.dart';

class FavoriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritesController());
  }
}
