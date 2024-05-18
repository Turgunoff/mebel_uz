import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:mebel_uz/screens/ProductDetails/product_detail_screen.dart';
import 'package:mebel_uz/screens/favorite/controller/controller.dart';
import 'package:mebel_uz/screens/home/controller/home_controller.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final HomeController controller = Get.put(HomeController());
  final FavoritesController favoritesController =
      Get.put(FavoritesController());

  final numberFormat = NumberFormat("#,##0", "en_US"); // Formatlash

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text('Избранное'),
        ),
        body: Obx(
          () => favoritesController.favorites.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'В Избранном пусто',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        textAlign: TextAlign.center,
                        'Добавьте товары, которые вам интересны!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.withOpacity(1),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Перейти в Каталог',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Har bir qatorda 2 ta mahsulot
                    childAspectRatio: 0.7, // Mahsulot kartasining nisbati
                    mainAxisSpacing: 2.0, // Vertikal oraliq
                    crossAxisSpacing: 2.0, // Gorizontal oraliq
                  ),
                  itemCount: favoritesController.favorites.length,
                  itemBuilder: (context, index) {
                    final favorites = favoritesController.favorites[index];
                    return Container(
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
                      // child: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Stack(
                      //       children: [
                      //         Container(
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(16.0)),
                      //           child: ClipRRect(
                      //             borderRadius: BorderRadius.circular(
                      //               8.0,
                      //             ),
                      //             child: CachedNetworkImage(
                      //               height: 150,
                      //               width: 150,
                      //               imageUrl: favorites.imageUrls[0],
                      //               fit: BoxFit.cover,
                      //               placeholder: (context, url) => const Center(
                      //                 child: CupertinoActivityIndicator(
                      //                   radius: 30,
                      //                   animating: true, // Control animation
                      //                 ),
                      //               ),
                      //               errorWidget: (context, url, error) =>
                      //                   const Icon(Icons.error),
                      //             ),
                      //           ),
                      //         ),
                      //         // if (hasDiscount) // Only show discount if applicable
                      //         //   Positioned(
                      //         //     bottom: 0, // Adjust positioning as needed
                      //         //     left: 0, // Adjust positioning as needed
                      //         //     child: Container(
                      //         //       padding: const EdgeInsets.symmetric(
                      //         //           horizontal: 8.0, vertical: 4.0),
                      //         //       decoration: const BoxDecoration(
                      //         //         color: Colors.red,
                      //         //         borderRadius: BorderRadius.only(
                      //         //           bottomLeft: Radius.circular(8.0),
                      //         //           topRight: Radius.circular(8.0),
                      //         //         ),
                      //         //       ),
                      //         //       child: Text(
                      //         //         '-${popularProducts.productDiscount}%',
                      //         //         style: const TextStyle(
                      //         //           color: Colors.white,
                      //         //           fontWeight: FontWeight.w500,
                      //         //           fontSize:
                      //         //               12.0, // Adjust font size as needed
                      //         //         ),
                      //         //       ),
                      //         //     ),
                      //         //   ),
                      //         Positioned(
                      //           top: 4,
                      //           right: 4,
                      //           child: Obx(() => GestureDetector(
                      //                 behavior: HitTestBehavior.opaque,
                      //                 onTap: () {
                      //                   // favoritesController
                      //                   //     .toggleFavorite(favorites);
                      //                 },
                      //                 child: Container(
                      //                   padding: const EdgeInsets.all(4),
                      //                   decoration: BoxDecoration(
                      //                     color: Colors.grey.shade400,
                      //                     borderRadius:
                      //                         BorderRadius.circular(50),
                      //                   ),
                      //                   child: Icon(
                      //                     Icons.favorite_border,
                      //                     color: Colors.yellow,
                      //                     size: 24,
                      //                   ),
                      //                 ),
                      //               )),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    );
                  },
                ),
        ));
  }
}
