
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:mebel_uz/constants/sized_box_extensions.dart';
import 'package:mebel_uz/models/product_model.dart';
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

  bool _switchValue = false;
  bool showMoreDetails = false;

  @override
  Widget build(BuildContext context) {
    final hasDiscount = widget.product.productDiscount! > 0;
    final discountAmount =
        (widget.product.productPrice! * widget.product.productDiscount!) / 100;
    final discountedPrice = widget.product.productPrice! - discountAmount;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBFF),
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
                          borderRadius: const BorderRadius.only(
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
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
                            fontSize: 24,
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
                              style: const TextStyle(
                                  fontSize: 32,
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
                              fontSize: hasDiscount ? 24.0 : 32.0,
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
                      12.kH,
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Описание',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Читать всё',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue.shade900,
                                  ),
                                )
                              ],
                            ),
                            12.kH,
                            const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'В статье демонстрируется сравнение web приложения скомпилированного в JavaScript и Wasm (который уже доступен как stable). Также рассказывается о том, что Flutter сегодня уже выходит за рамки Web и Mobile, так как LG будет использовать фреймворк для  разработки webOS. Не обошли стороной и геймдев, рассказав о некоторых новых фишках.',
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
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
                        length: 2, // Tablar soni
                        child: Column(
                          children: [
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300],
                              ),
                              child: TabBar(
                                indicator: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                indicatorSize: TabBarIndicatorSize.tab,
                                dividerColor: Colors.transparent,
                                padding: const EdgeInsets.all(2),
                                labelStyle: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                                tabs: const [
                                  Tab(
                                    text: 'Размеры',
                                  ),
                                  Tab(
                                    text: 'Характеристика',
                                  ),
                                ],
                              ),
                            ),
                            AutoScaleTabBarView(
                              children: [
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context, index) => ListTile(
                                    title: const Text(
                                      'Ширина, см',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: Text(
                                      '220',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (context, index) => Divider(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 7,
                                  itemBuilder: (context, index) => ListTile(
                                    title: const Text(
                                      'Ширина, см',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: Text(
                                      '220',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (context, index) => Divider(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  12.kH,
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Дополнительные услуги',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        12.kH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Сборка товара',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            CupertinoSwitch(
                              // iOS uslubidagi switch
                              value:
                                  _switchValue, // Switchning holati (yoqilgan/o'chirilgan)
                              onChanged: (bool value) {
                                setState(() {
                                  _switchValue = value;
                                  // Switch holati o'zgarganda bajarilishi kerak bo'lgan amallarni bu yerga qo'shing
                                });
                              },
                            ),
                          ],
                        ),
                        12.kH,
                        const Row(
                          children: [
                            Text(
                              'Стоимость: 250 000 so\'m',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        12.kH,
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showMoreDetails = !showMoreDetails;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                'Подробнее об услуге',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue[900],
                                ),
                              ),
                              Icon(
                                showMoreDetails
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                                color: Colors.blue[900],
                              ),
                            ],
                          ),
                        ),
                        12.kH,
                        if (showMoreDetails)
                          const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    height: 1.2,
                                  ),
                                  'Воспользуйтесь сборкой товара на дому! Наш специалист в кратчайшие сроки произведёт сборку товара и сэкономит Ваше время и силы.',
                                ),
                              ),
                            ],
                          ),
                        20.kH,
                      ],
                    ),
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
