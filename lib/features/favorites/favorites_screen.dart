import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mebel_uz/core/presentation/utils/sized_box_extensions.dart';
import 'package:mebel_uz/features/favorites/controller/favorites_controller.dart';
import 'package:mebel_uz/features/home/controller/home_controller.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final favoritesController = Get.find<FavoritesController>();

  final homeController = Get.find<HomeController>();

  final numberFormat = NumberFormat("#,##0", "en_US"); // Formatlash

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
      ),
      //       body: Obx(
      //         () => favoritesController.favorites.isEmpty
      //             ? Center(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     const Text(
      //                       'В Избранном пусто',
      //                       style: TextStyle(
      //                         fontSize: 20,
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.black,
      //                       ),
      //                     ),
      //                     const SizedBox(height: 20),
      //                     Text(
      //                       textAlign: TextAlign.center,
      //                       'Добавьте товары, которые вам интересны!',
      //                       style: TextStyle(
      //                         fontSize: 16,
      //                         color: Colors.grey.withOpacity(1),
      //                       ),
      //                     ),
      //                     const SizedBox(height: 20),
      //                     GestureDetector(
      //                       // onTap: () => Get.offNamed('categories_screen'),
      //                       child: Container(
      //                         padding: const EdgeInsets.symmetric(
      //                             horizontal: 16, vertical: 8),
      //                         decoration: BoxDecoration(
      //                           color: Theme.of(context).primaryColor,
      //                           borderRadius: BorderRadius.circular(8),
      //                         ),
      //                         child: const Text(
      //                           'Перейти в Каталог',
      //                           style: TextStyle(
      //                             color: Colors.white,
      //                             fontSize: 20,
      //                             fontWeight: FontWeight.bold,
      //                           ),
      //                         ),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               )
      //             : SizedBox(
      //                 height: 320, // Balandlikni o'zingizga mos ravishda sozlang
      //                 child: ListView.builder(
      //                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //                   scrollDirection: Axis.horizontal, // Gorizontal aylantirish
      //                   itemCount: favoritesController
      //                       .favorites.length, // Mahsulotlar soni
      //                   itemBuilder: (context, index) {
      //                     final discountAmount =
      //                         (favoritesController.favorites[index].productPrice! *
      //                                 favoritesController
      //                                     .favorites[index].productDiscount!) /
      //                             100;
      //                     final discountedPrice =
      //                         favoritesController.favorites[index].productPrice! -
      //                             discountAmount;
      //                     final hasDiscount = favoritesController
      //                             .favorites[index].productDiscount! >
      //                         0;

      //                     final favoriteProducts =
      //                         favoritesController.favorites[index];
      //                     final productPriceInDollars =
      //                         favoritesController.favorites[index].productPrice! /
      //                             homeController.usdRate; // Dollar kursiga nisbat
      //                     return GestureDetector(
      //                       onTap: () {
      //                         Get.to(
      //                           () => ProductDetailScreen(
      //                             productId: favoriteProducts.productId,
      //                           ),
      //                           transition: Transition.cupertino,
      //                         );
      //                       },
      //                       child: Container(
      //                         width: 170.0,
      //                         margin: const EdgeInsets.only(right: 8.0),
      //                         padding: const EdgeInsets.all(8.0),
      //                         decoration: BoxDecoration(
      //                           color: Colors.white,
      //                           borderRadius: BorderRadius.circular(10.0),
      //                           boxShadow: [
      //                             BoxShadow(
      //                               color: Colors.grey.shade100,
      //                               spreadRadius: 3,
      //                               blurRadius: 2,
      //                               offset: const Offset(0, 3),
      //                             ),
      //                           ],
      //                         ),
      //                         child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             // Rasm
      //                             Stack(
      //                               children: [
      //                                 Container(
      //                                   decoration: BoxDecoration(
      //                                       borderRadius:
      //                                           BorderRadius.circular(16.0)),
      //                                   child: ClipRRect(
      //                                     borderRadius: BorderRadius.circular(
      //                                       8.0,
      //                                     ),
      //                                     child: CachedNetworkImage(
      //                                       height: 150,
      //                                       width: 150,
      //                                       imageUrl: favoriteProducts.imageUrls[0],
      //                                       fit: BoxFit.cover,
      //                                       placeholder: (context, url) =>
      //                                           const Center(
      //                                         child: CupertinoActivityIndicator(
      //                                           radius: 30,
      //                                           animating:
      //                                               true, // Control animation
      //                                         ),
      //                                       ),
      //                                       errorWidget: (context, url, error) =>
      //                                           const Icon(Icons.error),
      //                                     ),
      //                                   ),
      //                                 ),
      //                                 if (hasDiscount) // Only show discount if applicable
      //                                   Positioned(
      //                                     bottom: 0, // Adjust positioning as needed
      //                                     left: 0, // Adjust positioning as needed
      //                                     child: Container(
      //                                       padding: const EdgeInsets.symmetric(
      //                                           horizontal: 8.0, vertical: 4.0),
      //                                       decoration: const BoxDecoration(
      //                                         color: Colors.red,
      //                                         borderRadius: BorderRadius.only(
      //                                           bottomLeft: Radius.circular(8.0),
      //                                           topRight: Radius.circular(8.0),
      //                                         ),
      //                                       ),
      //                                       child: Text(
      //                                         '-${favoriteProducts.productDiscount}%',
      //                                         style: const TextStyle(
      //                                           color: Colors.white,
      //                                           fontWeight: FontWeight.w500,
      //                                           fontSize:
      //                                               12.0, // Adjust font size as needed
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 Positioned(
      //                                   top: 4,
      //                                   right: 4,
      //                                   child: Obx(() => GestureDetector(
      //                                         behavior: HitTestBehavior.opaque,
      //                                         onTap: () {
      //                                           favoritesController.toggleFavorite(
      //                                               favoriteProducts);
      //                                         },
      //                                         child: Container(
      //                                           padding: const EdgeInsets.all(4),
      //                                           decoration: BoxDecoration(
      //                                             color: Colors.grey.shade400,
      //                                             borderRadius:
      //                                                 BorderRadius.circular(50),
      //                                           ),
      //                                           child: Icon(
      //                                             favoritesController.isFavorite(
      //                                                     favoriteProducts
      //                                                         .productId) // ID ni tekshirish
      //                                                 ? Icons.favorite
      //                                                 : Icons.favorite_border,
      //                                             color: Colors.yellow,
      //                                             size: 24,
      //                                           ),
      //                                         ),
      //                                       )),
      //                                 ),
      //                               ],
      //                             ),
      //                             const SizedBox(height: 8.0),
      //                             SizedBox(
      //                               height: 20.0,
      //                               child: Row(
      //                                 children: [
      //                                   Container(
      //                                     height: 20,
      //                                     width: 20,
      //                                     decoration: BoxDecoration(
      //                                       color: const Color.fromARGB(
      //                                           255, 142, 224, 149),
      //                                       borderRadius:
      //                                           BorderRadius.circular(4.0),
      //                                     ),
      //                                   ),
      //                                   const SizedBox(width: 4.0),
      //                                   Container(
      //                                     height: 20,
      //                                     width: 20,
      //                                     decoration: BoxDecoration(
      //                                       color: const Color.fromARGB(
      //                                           255, 175, 194, 209),
      //                                       borderRadius:
      //                                           BorderRadius.circular(4.0),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                             const SizedBox(height: 8.0),
      //                             Column(
      //                               crossAxisAlignment: CrossAxisAlignment.start,
      //                               children: [
      //                                 // Mahsulot nomi
      //                                 Text(
      //                                   favoriteProducts.productName,
      //                                   style: const TextStyle(
      //                                     fontWeight: FontWeight.bold,
      //                                     fontSize: 16.0,
      //                                     height: 1.2,
      //                                     letterSpacing: 0,
      //                                   ),
      //                                   maxLines: 2,
      //                                   overflow: TextOverflow.ellipsis,
      //                                 ),
      //                                 // Narx
      //                                 // Text('${product.price.toStringAsFixed(2)} so\'m'),
      //                               ],
      //                             ),
      //                             SizedBox(
      //                               height: 20,
      //                               child: Row(
      //                                 crossAxisAlignment: CrossAxisAlignment.center,
      //                                 mainAxisAlignment: MainAxisAlignment.start,
      //                                 children: [
      //                                   RatingBar.builder(
      //                                     itemBuilder: (context, index) =>
      //                                         const Icon(Icons.star,
      //                                             color: Colors.amber),
      //                                     initialRating: 5,
      //                                     minRating: 0,
      //                                     direction: Axis.horizontal,
      //                                     allowHalfRating: true,
      //                                     ignoreGestures: true,
      //                                     itemCount: 5,
      //                                     itemSize: 18.0,
      //                                     onRatingUpdate: (rating) {},
      //                                   ),
      //                                   const SizedBox(width: 4.0),
      //                                   const Text(
      //                                     '5.0',
      //                                     style: TextStyle(
      //                                       fontSize: 16.0,
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                             const SizedBox(height: 8.0),
      //                             const Spacer(),
      //                             Row(
      //                               crossAxisAlignment: CrossAxisAlignment.end,
      //                               children: [
      //                                 Column(
      //                                   crossAxisAlignment:
      //                                       CrossAxisAlignment.start,
      //                                   children: [
      //                                     if (hasDiscount)
      //                                       Text(
      //                                         '${numberFormat.format(discountedPrice)} so\'m'
      //                                             .replaceAll(',', ' '),
      //                                         style: const TextStyle(
      //                                           color: Colors.red,
      //                                           fontWeight: FontWeight.bold,
      //                                           fontSize: 16.0,
      //                                           height: 1,
      //                                           letterSpacing: -1,
      //                                         ),
      //                                       ),
      //                                     Text(
      //                                       '${numberFormat.format(favoriteProducts.productPrice)} so\'m'
      //                                           .replaceAll(',', ' '),
      //                                       style: TextStyle(
      //                                         height: 1,
      //                                         color: hasDiscount
      //                                             ? Colors.grey
      //                                             : Colors.black,
      //                                         fontWeight: FontWeight.bold,
      //                                         fontSize: 16.0,
      //                                         letterSpacing: -1.0,
      //                                         decoration: hasDiscount
      //                                             ? TextDecoration.lineThrough
      //                                             : TextDecoration.none,
      //                                         decorationColor: Colors.black,
      //                                         decorationStyle:
      //                                             TextDecorationStyle.solid,
      //                                       ),
      //                                     ),
      //                                     Text(
      //                                       ' ~ ${numberFormat.format(productPriceInDollars)} \$'
      //                                           .replaceAll(',', ' '),
      //                                       style: const TextStyle(
      //                                         height: 1,
      //                                         color: Colors.black,
      //                                         fontSize: 14.0,
      //                                         letterSpacing: -1.0,
      //                                         decorationColor: Colors.black,
      //                                       ),
      //                                     )
      //                                   ],
      //                                 ),
      //                                 const Spacer(),
      //                                 Container(
      //                                   padding: const EdgeInsets.symmetric(
      //                                       horizontal: 4.0, vertical: 4.0),
      //                                   decoration: BoxDecoration(
      //                                     color: Theme.of(context).primaryColor,
      //                                     borderRadius: BorderRadius.circular(8.0),
      //                                   ),
      //                                   child: const Icon(
      //                                     Iconsax.shopping_cart,
      //                                     color: Colors.white,
      //                                     size: 24.0,
      //                                   ),
      //                                 ),
      //                               ],
      //                             )
      //                           ],
      //                         ),
      //                       ),
      //                     );
      //                   },
      //                 ),
      //               ),
      //       ));
      // }
    );
  }
}
