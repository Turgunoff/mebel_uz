//home bindings

import 'package:get/get.dart';
import 'package:mebel_uz/features/home/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
