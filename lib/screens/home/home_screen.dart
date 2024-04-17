import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/models/product_model.dart';
import 'package:mebel_uz/screens/home/models/category_model.dart';

import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.notifications),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    fillColor: Colors.grey.shade200,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            //text categories
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Категории',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Показать все',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 130,
              child: Obx(() {
                if (controller.categoryList.isEmpty) {
                  return Center(child: const CircularProgressIndicator());
                } else {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    itemBuilder: (context, index) =>
                        buildCard(controller.categoryList[index]),
                    separatorBuilder: (context, _) =>
                        const SizedBox(width: 10.0),
                    itemCount: controller.categoryList.length,
                  );
                }
              }),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Рекомендации для вас',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Obx(() => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1 / 1.2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    return productCard(controller.productList[index], context);
                  },
                )),
          ],
        ),
      ),
    );
  }

  Widget buildCard(CategoryModel category) => SizedBox(
        width: 90,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                //boxshadow
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Image.network(
                category.categoryImage,
                // color: Colors.green,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              category.categoryName,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            )
          ],
        ),
      );
  Widget productCard(ProductModel productModel, context) => GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200, width: 1),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                child: Image.network(
                    height: 140,
                    width: double.infinity,
                    'https://mebel-complect.ru/wp-content/uploads/a/c/6/ac634abe8a2dd4841ad6c0a5f78935fb.jpeg',
                    fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 4.0, right: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productModel.productName,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${productModel.productPrice} so\'m',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.favorite, color: Theme.of(context).primaryColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
