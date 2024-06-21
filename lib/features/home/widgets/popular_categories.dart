//
// @Author: "Eldor Turgunov"
// @Date: 21.06.2024
// @File name: popular_categories
//

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/presentation/routes/app_routes.dart';
import '../../product_list_screen/controller/product_list_controller.dart';
import '../controller/home_controller.dart';

class PopularCategories extends StatelessWidget {
  final HomeController controller;

  const PopularCategories({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? const AspectRatio(
            aspectRatio: 3 / 1,
            child: Center(
              child: CupertinoActivityIndicator(
                radius: 10.0,
                animating: true,
              ),
            ),
          )
        : GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              childAspectRatio: 3 / 1,
            ),
            itemCount: controller.popularCategories.length > 6
                ? 6
                : controller.popularCategories.length,
            itemBuilder: (BuildContext context, int index) {
              final category = controller.popularCategories[index];
              final productListController = Get.find<ProductListController>();

              return GestureDetector(
                onTap: () {
                  productListController
                      .fetchProductsByCategory(category.categoryId.toString());
                  productListController.categoryName.value =
                      category.categoryNameRu;
                  Get.toNamed(AppRoutes.PRODUCT_LIST);
                },
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      CachedNetworkImage(
                        height: 40,
                        width: 40,
                        imageUrl: category.categoryImage,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(
                            radius: 10,
                            animating: true,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      const SizedBox(width: 8.0),
                      // Category Name
                      Expanded(
                        child: Text(
                          maxLines: 2,
                          category.categoryNameRu,
                          style: const TextStyle(
                            fontSize: 14.0,
                            letterSpacing: -1,
                            height: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ));
  }
}
