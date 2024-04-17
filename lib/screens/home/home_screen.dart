import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_double_arrow_right),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              if (controller.categoryList.value.isEmpty) {
                return const CircularProgressIndicator();
              } else {
                return SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    itemBuilder: (context, index) =>
                        buildCard(controller.categoryList.value[index]),
                    separatorBuilder: (context, _) =>
                        const SizedBox(width: 10.0),
                    itemCount: controller.categoryList.value.length,
                  ),
                );
              }
            }),
            Container(
              height: 1111,
              color: Colors.red,
            )
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
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              category.categoryImage,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            )
          ],
        ),
      );
}
