import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mebel_uz/core/presentation/utils/sized_box_extensions.dart';

import '../../../core/presentation/routes/app_routes.dart';
import '../controller/home_controller.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 300, // Balandlikni o'zingizga mos ravishda sozlang
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal, // Gorizontal aylantirish
            itemCount: controller.popularProducts.length, // Mahsulotlar soni
            itemBuilder: (context, index) {
              final popularProducts = controller.popularProducts[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.PRODUCT_DETAIL,
                      arguments: popularProducts.productId);
                  // controller.navigateToProductDetails(
                  //     popularProducts.productId); // O'tish metodi chaqirilmoqda
                },
                child: Container(
                  width: 170.0,
                  margin: const EdgeInsets.only(right: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Rasm
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                              child: CachedNetworkImage(
                                height: 150,
                                width: 150,
                                imageUrl: popularProducts.imageUrls[0],
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CupertinoActivityIndicator(
                                    radius: 10,
                                    animating: true, // Control animation
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          if (popularProducts.productDiscount! >
                              0) // Only show discount if applicable
                            Positioned(
                              bottom: 0, // Adjust positioning as needed
                              left: 0, // Adjust positioning as needed
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                ),
                                child: Text(
                                  '-${popularProducts.productDiscount}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        12.0, // Adjust font size as needed
                                  ),
                                ),
                              ),
                            ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  // favoritesController
                                  //     .toggleFavorite(popularProducts);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    // favoritesController.isFavorite(
                                    //         popularProducts
                                    //             .productId) // ID ni tekshirish
                                    //     ? Icons.favorite
                                    Icons.favorite_border,
                                    color: Colors.yellow,
                                    size: 24,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      8.kH,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Mahsulot nomi
                          Text(
                            popularProducts.productName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              height: 1.2,
                              letterSpacing: 0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // Narx
                          // Text('${product.price.toStringAsFixed(2)} so\'m'),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RatingBar.builder(
                              itemBuilder: (context, index) =>
                                  const Icon(Icons.star, color: Colors.amber),
                              initialRating: 5,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              ignoreGestures: true,
                              itemCount: 5,
                              itemSize: 18.0,
                              onRatingUpdate: (rating) {},
                            ),
                            const SizedBox(width: 4.0),
                            const Text(
                              '5.0',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      8.kH,
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (popularProducts.productDiscount! > 0)
                                Text(
                                  '${(popularProducts.productPrice! - popularProducts.productPrice! * popularProducts.productDiscount! / 100).toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} so\'m',
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    height: 1,
                                    letterSpacing: -1,
                                  ),
                                ),
                              Text(
                                '${popularProducts.productPrice!.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} so\'m',
                                style: TextStyle(
                                  height: 1,
                                  color: popularProducts.productDiscount! > 0
                                      ? Colors.grey
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  letterSpacing: -1.0,
                                  decoration:
                                      popularProducts.productDiscount! > 0
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                  decorationColor: Colors.black,
                                  decorationStyle: TextDecorationStyle.solid,
                                ),
                              ),
                              Text(
                                '~${((popularProducts.productPrice! - popularProducts.productPrice! * popularProducts.productDiscount! / 100) / controller.usdRate).toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} \$',
                                style: const TextStyle(
                                  height: 1,
                                  fontSize: 14.0,
                                  letterSpacing: -1.0,
                                  decorationColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Icon(
                              Iconsax.shopping_cart,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}


// Get.to(
                  //   () => ProductDetailScreen(
                  //     productId:
                  //         popularProducts.productId, // productId ni yuborish
                  //   ),
                  //   transition: Transition.cupertino,
                  // );