import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controller/product_list_controller.dart';

class ProductListAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ProductListAppbar({
    super.key,
    required ProductListController controller,
  }) : _controller = controller;

  final ProductListController _controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Iconsax.arrow_left_2,
          size: 24,
          color: Theme.of(context).primaryColor,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Colors.grey.shade300,
          height: 1,
        ),
      ),
      title: Obx(() => Text(
            _controller.categoryName.value,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          )),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // AppBar balandligi
}
