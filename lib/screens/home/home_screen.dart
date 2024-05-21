import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:mebel_uz/constants/sized_box_extensions.dart';
import 'package:mebel_uz/screens/product_details/product_detail_screen.dart';
import 'package:mebel_uz/screens/favorite/controller/controller.dart';
import 'package:mebel_uz/screens/product_list_screen/controller/product_list_controller.dart';
import 'package:mebel_uz/screens/product_list_screen/product_list_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  final favoritesController = Get.put(FavoritesController());

  final numberFormat = NumberFormat('#,##0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Iconsax.notification,
              size: 25,
              color: Colors.grey,
            ),
          ),
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    fillColor: Color(0xFFF3F2F7),
                    prefixIcon: Icon(
                      Iconsax.search_normal,
                      color: Colors.grey,
                      size: 25,
                    ),
                    hintText: 'Поиск товаров',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sectionText('Популярные категории'),
            popularCategories(),
            sectionText('Хиты продаж'),
            popularProducts(),
            12.kH,
            installmentSection(),
            sectionText('Лучшие предложения'),
            bestOffers(),
            12.kH,
            offer(),
            12.kH,
            contactUs(),
            12.kH,
          ],
        ),
      ),
    );
  }

  sectionText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            // 'Популярные категории',
            style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  contactUs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: MediaQuery.sizeOf(context).width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isDismissible: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),
            context: context,
            builder: (context) => Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Связаться с нами',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  12.kH,
                  ListTile(
                    leading: Icon(Iconsax.call,
                        color: Theme.of(context).primaryColor),
                    title: const Text(
                      'Позвонить нам',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onTap: () async {
                      // Telefon raqamini bu yerga kiriting
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: '+998946433733',
                      );
                      if (await canLaunchUrl(launchUri)) {
                        await launchUrl(launchUri);
                      } else {
                        throw 'Could not launch $launchUri';
                      }
                      Navigator.pop(context);
                    },
                  ),
                  Divider(
                    color: Colors.grey[300],
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(Iconsax.message,
                        color: Theme.of(context).primaryColor),
                    title: const Text(
                      'Telegram',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onTap: () async {
                      final Uri launchUri = Uri(
                        scheme: 'https',
                        path: 't.me/e_turgunoff',
                      );
                      if (await canLaunchUrl(launchUri)) {
                        await launchUrl(launchUri);
                      } else {
                        throw 'Could not launch $launchUri';
                      }
                      Navigator.pop(context);
                    },
                  ),
                  12.kH,
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Закрить',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor,
              ),
              child: const Icon(
                Iconsax.call,
                color: Colors.white,
                size: 36,
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Связаться с нами',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'По любым вопросам',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Iconsax.arrow_right_3,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  offer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Почему Mebel.uz?',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(Iconsax.play_cricle),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  'Марка №1 в Узбекстане в сегменте "корпусная мебельная"',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      height: 1,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 2.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(Iconsax.play_cricle),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  'Натуральное и экологическое материалы',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      height: 1,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 2.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(Iconsax.play_cricle),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  'Бистрая доставка и профессионльная сборка',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      height: 1,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 2.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(Iconsax.play_cricle),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  '3 года гарантии на мебель, пожизненная на фурнитуру',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bestOffers() {
    return Obx(
      () => SizedBox(
        height: 320, // Balandlikni o'zingizga mos ravishda sozlang
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          scrollDirection: Axis.horizontal, // Gorizontal aylantirish
          itemCount: controller.popularProducts.length, // Mahsulotlar soni
          itemBuilder: (context, index) {
            final discountAmount =
                (controller.popularProducts[index].productPrice! *
                        controller.popularProducts[index].productDiscount!) /
                    100;
            final discountedPrice =
                controller.popularProducts[index].productPrice! -
                    discountAmount;
            final hasDiscount =
                controller.popularProducts[index].productDiscount! > 0;

            final popularProducts = controller.popularProducts[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => ProductDetailScreen(
                      product: popularProducts,
                    ));
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
                                  radius: 30,
                                  animating: true, // Control animation
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
                                '-${popularProducts.productDiscount?.toStringAsFixed(0)}%',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0, // Adjust font size as needed
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
                                  favoritesController
                                      .toggleFavorite(popularProducts);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    favoritesController.isFavorite(
                                            popularProducts.productId)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.yellow,
                                    size: 24,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      height: 20.0,
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 142, 224, 149),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 175, 194, 209),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
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
                    const SizedBox(height: 8.0),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              '${numberFormat.format(popularProducts.productPrice)} so\'m'
                                  .replaceAll(',', ' '),
                              style: TextStyle(
                                height: 1,
                                color: hasDiscount ? Colors.grey : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                letterSpacing: -1.0,
                                decoration: hasDiscount
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                decorationColor: Colors.black,
                                decorationStyle: TextDecorationStyle.solid,
                              ),
                            ),
                            Text(
                              ' ~ ${numberFormat.format(1200)} \$'
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

  installmentSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Рассрочка',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(Iconsax.play_cricle),
              ),
              const SizedBox(width: 16.0),
              const Text(
                'Переплата 0%',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 2.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(Iconsax.play_cricle),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  'Можна оформить на 6, 9, 12 и 24 месяца',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(Iconsax.play_cricle),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  'Удобное оформление за 15 минут',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  popularProducts() {
    return Obx(
      () => SizedBox(
        height: 320, // Balandlikni o'zingizga mos ravishda sozlang
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          scrollDirection: Axis.horizontal, // Gorizontal aylantirish
          itemCount: controller.popularProducts.length, // Mahsulotlar soni
          itemBuilder: (context, index) {
            final discountAmount =
                (controller.popularProducts[index].productPrice! *
                        controller.popularProducts[index].productDiscount!) /
                    100;
            final discountedPrice =
                controller.popularProducts[index].productPrice! -
                    discountAmount;
            final hasDiscount =
                controller.popularProducts[index].productDiscount! > 0;

            final popularProducts = controller.popularProducts[index];
            final productPriceInDollars =
                controller.popularProducts[index].productPrice! /
                    controller.usdRate; // Dollar kursiga nisbat
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => ProductDetailScreen(
                    product: popularProducts,
                  ),
                  transition: Transition.cupertino,
                );
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
                                  radius: 30,
                                  animating: true, // Control animation
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
                                '-${popularProducts.productDiscount}%',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0, // Adjust font size as needed
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
                                  favoritesController
                                      .toggleFavorite(popularProducts);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    favoritesController.isFavorite(
                                            popularProducts
                                                .productId) // ID ni tekshirish
                                        ? Icons.favorite
                                        : Icons.favorite_border,
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
                              color: const Color.fromARGB(255, 142, 224, 149),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 175, 194, 209),
                              borderRadius: BorderRadius.circular(4.0),
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
                              '${numberFormat.format(popularProducts.productPrice)} so\'m'
                                  .replaceAll(',', ' '),
                              style: TextStyle(
                                height: 1,
                                color: hasDiscount ? Colors.grey : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                letterSpacing: -1.0,
                                decoration: hasDiscount
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                decorationColor: Colors.black,
                                decorationStyle: TextDecorationStyle.solid,
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

  popularCategories() {
    return Obx(() => GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            childAspectRatio: 3 / 1,
          ),
          itemCount: controller.categories.length > 6
              ? 6
              : controller.categories.length,
          itemBuilder: (BuildContext context, int index) {
            final category = controller.categories[index];
            final productListController = Get.put(ProductListController());
            return GestureDetector(
              onTap: () {
                productListController
                    .fetchProductsByCategory(category.categoryId.toString());
                productListController.categoryName.value =
                    category.categoryNameRu;
                Get.to(
                  () => ProductListScreen(),
                );
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
                    // Category Image
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
