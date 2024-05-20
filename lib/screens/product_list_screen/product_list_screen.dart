import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mebel_uz/screens/product_list_screen/controller/product_list_controller.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({
    super.key,
  });

  final ProductListController _controller = Get.put(ProductListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Iconsax.arrow_left_2,
            size: 24,
            color: Theme.of(context).primaryColor,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
        title: Obx(() => Text(
              _controller.categoryName.value,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            )),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
            itemCount: _controller.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_controller.products[index].categoryName),
                subtitle:
                    Text(_controller.products[index].productPrice.toString()),
              );
            },
          )),
    );
  }
}
