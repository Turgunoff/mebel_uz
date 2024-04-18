import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel productModel;

  ProductDetailScreen({super.key, required this.productModel});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _pageViewController = PageController(initialPage: 0);
  int _activePage = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageViewController.dispose(); // dispose the PageController
  }

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
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: PageView.builder(
                      pageSnapping: true,
                      controller: _pageViewController,
                      onPageChanged: (int index) {
                        setState(() {
                          _activePage = index;
                        });
                      },
                      reverse: false,
                      itemCount: widget.productModel.productImages!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              widget.productModel.productImages![index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                          widget.productModel.productImages!.length,
                          (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: InkWell(
                                  onTap: () {
                                    _pageViewController.animateToPage(index,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  },
                                  child: CircleAvatar(
                                    radius: 4,
                                    // check if a dot is connected to the current page
                                    // if true, give it a different color
                                    backgroundColor: _activePage == index
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey.shade400,
                                  ),
                                ),
                              )),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: widget.productModel.productRating.toDouble(),
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 16,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(width: 5),
                      //text uneventful
                      Text(
                        // productModel.productRating==0 ? 'Baxolanmagan' : productModel.productRating!.toString(),
                        widget.productModel.productRating == 0
                            ? 'Baxolanmagan'
                            : widget.productModel.productRating.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //text bold
                  Text(
                    widget.productModel.productName,
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
                        '${widget.productModel.productPrice} so\'m',
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
                    widget.productModel.productDescription,
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
