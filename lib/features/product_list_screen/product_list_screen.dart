import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mebel_uz/core/presentation/utils/sized_box_extensions.dart';

import '../../core/presentation/routes/app_routes.dart';
import '../favorites/controller/favorites_controller.dart';
import '../home/controller/home_controller.dart';
import 'controller/product_list_controller.dart';
import 'widgets/product_list_appbar.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({
    super.key,
  });

  final _controller = Get.find<ProductListController>();
  final homeController = Get.find<HomeController>();
  final favoritesController = Get.find<FavoritesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductListAppbar(controller: _controller),
      body: Obx(
        () => _controller.isLoading.value
            ? const Center(
                child: CupertinoActivityIndicator(
                  radius: 10,
                  animating: true,
                ),
              )
            : _controller.products.isEmpty
                ? Center(
                    child: Text(
                      'Товары не найдены.',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    // gridDelegate:
                    //     const SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 2,
                    //   childAspectRatio: 0.53,
                    //   mainAxisSpacing: 10,
                    //   crossAxisSpacing: 10,
                    // ),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      childAspectRatio: 3 / 5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _controller.products.length,
                    itemBuilder: (context, index) {
                      final listProducts = _controller.products[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.productDetail,
                              arguments: listProducts.productId);
                          // Get.to(
                          //   () => ProductDetailScreen(
                          //     productId: listProducts.productId,
                          //   ),
                          //   transition: Transition.cupertino,
                          // );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        8.0,
                                      ),
                                      child: CachedNetworkImage(
                                        height: 150,
                                        width: double.infinity,
                                        imageUrl: _controller
                                            .products[index].imageUrls[0],
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CupertinoActivityIndicator(
                                            radius: 10,
                                            animating:
                                                true, // Control animation
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  if (listProducts.productDiscount! >
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
                                          '-${listProducts.productDiscount}%',
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
                                    child: Obx(() => GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            favoritesController.toggleFavorite(
                                                listProducts.productId);
                                            // favoritesController
                                            //     .toggleFavorite(listProducts);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade400,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Icon(
                                              favoritesController.isFavorite(
                                                      listProducts.productId)
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              // favoritesController.isFavorite(
                                              //         listProducts
                                              //             .productId) // ID ni tekshirish
                                              //     ? Icons.favorite
                                              color: Colors.yellow,
                                              size: 24,
                                            ),
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
                                    listProducts.productName,
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
                                          const Icon(Icons.star,
                                              color: Colors.amber),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (listProducts.productDiscount! > 0)
                                        Text(
                                          '${(listProducts.productPrice! - listProducts.productPrice! * listProducts.productDiscount! / 100).toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} so\'m'
                                              .replaceAll(',', ' '),
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            height: 1,
                                            letterSpacing: -1,
                                          ),
                                        ),
                                      Text(
                                        '${listProducts.productPrice!.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} so\'m'
                                            .replaceAll(',', ' '),
                                        style: TextStyle(
                                          height: 1,
                                          color:
                                              listProducts.productDiscount! > 0
                                                  ? Colors.grey
                                                  : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          letterSpacing: -1.0,
                                          decoration:
                                              listProducts.productDiscount! > 0
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none,
                                          decorationColor: Colors.black,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                        ),
                                      ),
                                      Text(
                                        '~${((listProducts.productPrice! - listProducts.productPrice! * listProducts.productDiscount! / 100) / homeController.usdRate).toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} \$'
                                            .replaceAll(',', ' '),
                                        style: const TextStyle(
                                          height: 1,
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          letterSpacing: -1.0,
                                          decorationColor: Colors.black,
                                        ),
                                      )
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
      ),
    );
  }
}
