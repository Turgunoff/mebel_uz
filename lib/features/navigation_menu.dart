import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mebel_uz/features/cart/cart_screen.dart';
import 'package:mebel_uz/features/categories/categories_screen.dart';
import 'package:mebel_uz/features/favorite/controller/controller.dart';
import 'package:mebel_uz/features/favorite/favorite_screen.dart';
import 'package:mebel_uz/features/home/home_screen.dart';
import 'package:mebel_uz/features/profile/profile_screen.dart';
import 'package:badges/badges.dart' as badges; // badges paketini import qiling

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  //controller
  final controller = Get.put(NavigationController());
  final favoritesController = Get.put(FavoritesController());

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
          destinations: [
            const NavigationDestination(
              selectedIcon: Icon(Iconsax.home, color: Colors.white),
              icon: Icon(Iconsax.home),
              label: 'Главная',
            ),
            NavigationDestination(
              selectedIcon: Obx(
                () => badges.Badge(
                  badgeContent: Text(
                    favoritesController.favorites.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  showBadge: favoritesController.favorites.isNotEmpty,
                  position: badges.BadgePosition.topEnd(top: -8, end: -8),
                  child: const Icon(Iconsax.heart,
                      color: Colors
                          .white), // Tanlangan ikonka uchun rangni o'zgartiring
                ),
              ),
              icon: Obx(
                () => badges.Badge(
                  badgeContent: Text(
                    favoritesController.favorites.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  showBadge: favoritesController.favorites.isNotEmpty,
                  position: badges.BadgePosition.topEnd(top: -8, end: -8),
                  child: const Icon(Iconsax
                      .heart), // Tanlanmagan ikonka uchun rangni o'zgartiring
                ),
              ),
              label: 'Избранное',
            ),
            const NavigationDestination(
              selectedIcon: Icon(Iconsax.category, color: Colors.white),
              icon: Icon(Iconsax.category),
              label: 'Каталог',
            ),
            const NavigationDestination(
              selectedIcon: Icon(Iconsax.shopping_cart, color: Colors.white),
              icon: Icon(Iconsax.shopping_cart),
              label: 'Корзина',
            ),
            const NavigationDestination(
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
    const HomeScreen(),
    FavoriteScreen(),
    CategoriesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
}
