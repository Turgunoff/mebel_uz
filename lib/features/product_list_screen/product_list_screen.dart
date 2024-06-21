import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:mebel_uz/core/presentation/utils/sized_box_extensions.dart';
import 'package:mebel_uz/features/favorites/controller/favorites_controller.dart';
import 'package:mebel_uz/features/home/controller/home_controller.dart';
import 'package:mebel_uz/features/product_detail/product_detail_screen.dart';
import 'package:mebel_uz/features/product_list_screen/controller/product_list_controller.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({
    super.key,
  });

  final ProductListController _controller = Get.find<ProductListController>();
  final homeController = Get.find<HomeController>();
  final favoritesController = Get.find<FavoritesController>();

  final numberFormat = NumberFormat('#,##0');

// _controller.products.length
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Obx(
        () => _controller.isLoading.value
            ? const Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                ),
              )
            : _controller.products.isEmpty
                ? Center(
                    child: Text(
                      'No products found.',
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
                      childAspectRatio: 3 / 5.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _controller.products.length,
                    itemBuilder: (context, index) {
                      final discountAmount = (_controller
                                  .products[index].productPrice! *
                              _controller.products[index].productDiscount!) /
                          100;
                      final discountedPrice =
                          _controller.products[index].productPrice! -
                              discountAmount;
                      final hasDiscount =
                          _controller.products[index].productDiscount! > 0;

                      final listProducts = _controller.products[index];
                      final productPriceInDollars =
                          _controller.products[index].productPrice! /
                              homeController.usdRate; // Dollar kursiga nisbat
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => ProductDetailScreen(
                              productId: listProducts.productId,
                            ),
                            transition: Transition.cupertino,
                          );
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
                                        height: 160,
                                        width: double.infinity,
                                        imageUrl: _controller
                                            .products[index].imageUrls[0],
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CupertinoActivityIndicator(
                                            radius: 30,
                                            animating:
                                                true, // Control animation
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  if (hasDiscount) // Only show discount if applicable
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
                                              // favoritesController.isFavorite(
                                              //         listProducts
                                              //             .productId) // ID ni tekshirish
                                              //     ? Icons.favorite
                                              Icons.favorite_border,
                                              color: Colors.yellow,
                                              size: 24,
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              8.kH,
                              SizedBox(
                                height: 20.0,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 142, 224, 149),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 175, 194, 209),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                  ],
                                ),
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
                                      if (hasDiscount)
                                        Text(
                                          '${numberFormat.format(discountedPrice)} so\'m'
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
                                        '${numberFormat.format(listProducts.productPrice)} so\'m'
                                            .replaceAll(',', ' '),
                                        style: TextStyle(
                                          height: 1,
                                          color: hasDiscount
                                              ? Colors.grey
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          letterSpacing: -1.0,
                                          decoration: hasDiscount
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          decorationColor: Colors.black,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                        ),
                                      ),
                                      Text(
                                        ' ~ ${numberFormat.format(productPriceInDollars)} \$'
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
