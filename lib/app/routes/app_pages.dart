import 'package:get/get.dart';
import 'package:mebel_uz/app/bindings/favorite_binding.dart';
import 'package:mebel_uz/app/bindings/home_binding.dart';
import 'package:mebel_uz/app/bindings/product_list_binding.dart';
import 'package:mebel_uz/app/routes/app_routes.dart';
import 'package:mebel_uz/features/favorites/favorites_screen.dart';
import 'package:mebel_uz/features/home/home_screen.dart';
import 'package:mebel_uz/features/splash/splash_screen.dart';

import '../../features/product_list_screen/product_list_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.FAVORITE,
      page: () => FavoriteScreen(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: AppRoutes.PRODUCT_LIST,
      page: () => ProductListScreen(),
      binding: ProductListBinding(),
    )
  ];
}
