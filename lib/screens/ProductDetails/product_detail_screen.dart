import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left_2),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Iconsax.share),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Iconsax.heart),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          fit: BoxFit.fitWidth,
                          productModel.productImages![0],
                          height: MediaQuery.sizeOf(context).height * 0.3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 16,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 122, 109, 70),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(width: 5),
                      //text uneventful
                      Text(
                        // productModel.productRating==0 ? 'Baxolanmagan' : productModel.productRating!.toString(),
                        productModel.productRating == 0
                            ? 'Baxolanmagan'
                            : productModel.productRating.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //text bold
                  Text(
                    productModel.productName,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  //price product
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${productModel.productPrice} so\'m',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //text description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //text description
                  Text(
                    productModel.productDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.car,
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Yetkazib berish',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text('Yetkazib berish muddati:'),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.sizeOf(context).width * 0.05),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Toshkent bo\'ylab 1 kunda,'),
                              Text('Respublika bo\'ylab 3 kunda.'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () => Get.snackbar('', 'Savatchaga qo\'shildi',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  duration: const Duration(seconds: 2)),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                width: double.infinity,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Iconsax.shopping_cart,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Savatga qo\'shish',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
