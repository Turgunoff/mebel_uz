import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/core/presentation/utils/sized_box_extensions.dart';

import '../controller/favorites_controller.dart';

class FavoritesAppbar extends StatelessWidget implements PreferredSizeWidget {
  const FavoritesAppbar({
    super.key,
    required this.favoritesController,
  });

  final FavoritesController favoritesController;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: favoritesController.favorites.isNotEmpty ? false : true,
      elevation: 0,
      title: Obx(() => Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Избранное',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              12.kW,
              if (favoritesController.favorites.isNotEmpty)
                Text(
                  '${favoritesController.favorites.length.toString()} товар',
                  style: TextStyle(
                    color: Colors.grey.withOpacity(1),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ],
          )),
    );
  }
}
