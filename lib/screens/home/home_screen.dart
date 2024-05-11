import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Популярные категории',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                childAspectRatio: 3 / 1.2,
              ),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
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
                      Image.network(
                        'https://cdn.lazurit.com/images/unsafe/fit-in/1000x1000/upload.lazurit.com/upload/iblock/b98/q8wdjymu8cynhb5m1d2v04o8zo57zxye/km0120_dub-bellazhdio_01.jpg',
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 4.0),
                      // Category Name
                      const Expanded(
                        child: Text(
                          maxLines: 2,
                          'Category Name adfasf asf as f as',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Text(
                  'Хиты продаж',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200, // Balandlikni o'zingizga mos ravishda sozlang
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Gorizontal aylantirish
                itemCount: 50, // Mahsulotlar soni
                itemBuilder: (context, index) {
                  // final product = controller.products[index];
                  return Container(
                    width: 150, // Kenglikni o'zingizga mos ravishda sozlang
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Rasm
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://cdn.lazurit.com/images/unsafe/fit-in/1000x1000/upload.lazurit.com/upload/iblock/b98/q8wdjymu8cynhb5m1d2v04o8zo57zxye/km0120_dub-bellazhdio_01.jpg',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Mahsulot nomi
                              Text(
                                'product.name',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // Narx
                              // Text('${product.price.toStringAsFixed(2)} so\'m'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Column(
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
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
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
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
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
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
