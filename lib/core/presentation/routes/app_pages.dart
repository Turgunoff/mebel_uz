import 'package:get/get.dart';

import 'app_routes.dart';
import '../../../features/cart/bindings/cart_binding.dart';
import '../../../features/cart/cart_screen.dart';
import '../../../features/categories/bindings/categories_binding.dart';
import '../../../features/categories/categories_screen.dart';
import '../../../features/favorites/favorites_screen.dart';
import '../../../features/home/home_screen.dart';
import '../../../features/product_detail/bindings/product_detail_binding.dart';
import '../../../features/product_detail/product_detail_screen.dart';
import '../../../features/splash/splash_screen.dart';
import '../../../features/profile/bindings/profile_binding.dart';
import '../../../features/profile/profile_screen.dart';
import '../../../features/favorites/bindings/favorites_binding.dart';
import '../../../features/home/bindings/home_binding.dart';
import '../../../features/product_list_screen/bindings/product_list_binding.dart';
import '../../../features/product_list_screen/product_list_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.favorites,
      page: () => FavoritesScreen(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: AppRoutes.productList,
      page: () => ProductListScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoutes.categories,
      page: () => CategoriesScreen(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: AppRoutes.productDetail,
      page: () => ProductDetailScreen(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
