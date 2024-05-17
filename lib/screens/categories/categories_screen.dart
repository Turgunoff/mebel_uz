import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mebel_uz/screens/categories/controller/categories_controller.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final controller = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.search_normal),
            onPressed: () {
              // Add your search functionality here
            },
          ),
        ],
        title: const Text('Каталог'),
      ),
      body: Obx(() => ListView.separated(
            itemCount: controller
                .categories.length, // Replace with your actual data length
            itemBuilder: (context, index) {
              final category = controller.categories[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                leading: CachedNetworkImage(
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                  imageUrl: category.categoryImage,
                  placeholder: (context, url) => const SizedBox(
                      width: 30,
                      height: 30,
                      child: CupertinoActivityIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                title: Text(
                  category.categoryNameRu,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Iconsax.arrow_right_3,
                  size: 20,
                ),
                onTap: () {
                  // Add your navigation logic here
                },
              );
            },
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey.shade300,
            ),
          )),
    );
  }
}
