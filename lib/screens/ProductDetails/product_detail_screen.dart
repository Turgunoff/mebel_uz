// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:mebel_uz/constants/sized_box_extensions.dart';
import 'package:mebel_uz/models/product_model.dart';
import 'package:mebel_uz/screens/navigation_menu.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _pageController =
      PageController(); // PageController obyektini yaratish

  @override
  void dispose() {
    _pageController.dispose(); // Obyektni yo'q qilish
    super.dispose();
  }

  final numberFormat = NumberFormat('#,##0');

  @override
  Widget build(BuildContext context) {
    final hasDiscount = widget.product.productDiscount! > 0;
    final discountAmount =
        (widget.product.productPrice! * widget.product.productDiscount!) / 100;
    final discountedPrice = widget.product.productPrice! - discountAmount;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Iconsax.arrow_left_2,
                size: 24,
                color: Theme.of(context).primaryColor,
              ),
              Text(
                'Назад',
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Icon(
            Iconsax.message,
            size: 24,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 12),
          Icon(
            Iconsax.share,
            size: 24,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 12),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
              width: double.infinity,
              child: Stack(
                children: [
                  PageView.builder(
                    clipBehavior: Clip.none,
                    controller: _pageController,
                    itemCount: widget.product.imageUrls.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: widget.product.imageUrls[index],
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(
                            radius: 20,
                            animating: true, // Control animation
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      );
                    },
                  ),
                  Positioned(
                    // Indikatorni joylashtiramiz
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      // Indikatorni markazga qo'yamiz
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: widget.product.imageUrls.length,
                          effect: WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            activeDotColor: Theme.of(context).primaryColor,
                            dotColor: Colors.grey.shade400,
                          ),
                        ),
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
                        decoration: BoxDecoration(
                          color: Colors.red.shade900,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          '-${widget.product.productDiscount?.toStringAsFixed(0)}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0, // Adjust font size as needed
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.productName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            height: 0,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.kH,
                  Column(
                    children: [
                      if (hasDiscount)
                        Row(
                          children: [
                            Text(
                              '${numberFormat.format(discountedPrice)} so\'m'
                                  .replaceAll(',', ' '),
                              style: TextStyle(
                                  fontSize: 26,
                                  letterSpacing: -1.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            20.kW,
                            Text(
                              '${widget.product.productDiscount?.toStringAsFixed(0)}% скидка',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red.shade900),
                            ),
                          ],
                        ),
                      Row(
                        children: [
                          Text(
                            '${numberFormat.format(widget.product.productPrice)} so\'m'
                                .replaceAll(',', ' '),
                            style: TextStyle(
                              height: 1,
                              color: hasDiscount ? Colors.grey : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: hasDiscount ? 18.0 : 26.0,
                              letterSpacing: -1.0,
                              decoration: hasDiscount
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationColor: Colors.black,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Описание',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Читать всё',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue.shade900,
                                  ),
                                )
                              ],
                            ),
                            12.kH,
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'В статье демонстрируется сравнение web приложения скомпилированного в JavaScript и Wasm (который уже доступен как stable). Также рассказывается о том, что Flutter сегодня уже выходит за рамки Web и Mobile, так как LG будет использовать фреймворк для  разработки webOS. Не обошли стороной и геймдев, рассказав о некоторых новых фишках.',
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      12.kH,
                      DefaultTabController(
                        // TabView uchun DefaultTabController kerak
                        length: 2, // Tablar soni
                        child: Column(
                          children: [
                            TabBar(
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.black,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: Colors.red,
                              ),
                              tabs: [
                                Tab(
                                  text: 'O\'lchami',
                                ),
                                Tab(text: 'Tafsilotlari'),
                              ],
                            ),
                            SizedBox(
                              height: 200, // TabBarView balandligi
                              child: TabBarView(
                                children: [
                                  // O'lchami tab content
                                  Center(
                                      child:
                                          Text('O\'lchami haqida ma\'lumot')),

                                  // Tafsilotlari tab content
                                  Center(
                                      child: Text(
                                          'Tafsilotlari haqida ma\'lumot')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          textAlign: TextAlign.center,
          'Добавить в корзину',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
