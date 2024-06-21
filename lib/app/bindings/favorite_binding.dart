//home bindings

import 'package:get/get.dart';
import 'package:mebel_uz/features/favorites/controller/favorites_controller.dart';

class FavoriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritesController());
  }
}
