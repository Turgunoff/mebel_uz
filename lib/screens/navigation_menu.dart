import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mebel_uz/screens/cart/cart_screen.dart';
import 'package:mebel_uz/screens/categories/categories_screen.dart';
import 'package:mebel_uz/screens/favorite/favorite_screen.dart';
import 'package:mebel_uz/screens/home/home_screen.dart';
import 'package:mebel_uz/screens/profile/profile_screen.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  //controller
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80.0,
          elevation: 0,
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: (index) =>
              controller.currentIndex.value = index,
          backgroundColor: const Color(0xFFF9F9F9),
          indicatorColor: Theme.of(context).primaryColor,
          animationDuration: const Duration(milliseconds: 300),
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Iconsax.home, color: Colors.white),
              icon: Icon(Iconsax.home),
              label: 'Главная',
            ),
            NavigationDestination(
              selectedIcon: Icon(Iconsax.category, color: Colors.white),
              icon: Icon(Iconsax.category),
              label: 'Каталог',
            ),
            NavigationDestination(
              selectedIcon:
                  Icon(Iconsax.notification_favorite, color: Colors.white),
              icon: Icon(Iconsax.notification_favorite),
              label: 'Избранное',
            ),
            NavigationDestination(
              selectedIcon: Icon(Iconsax.shopping_cart, color: Colors.white),
              icon: Icon(Iconsax.shopping_cart),
              label: 'Корзина',
            ),
            NavigationDestination(
              selectedIcon: Icon(Iconsax.profile_circle, color: Colors.white),
              icon: Icon(Iconsax.profile_circle),
              label: 'Профиль',
            ),
          ],
        ),
      ),
      body: Obx(
        () => controller.screens[controller.currentIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final screens = [
    HomeScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
}
