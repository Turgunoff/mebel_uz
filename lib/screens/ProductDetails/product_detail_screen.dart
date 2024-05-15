import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mebel_uz/models/product_model.dart';
import 'package:mebel_uz/screens/navigation_menu.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
              child: CachedNetworkImage(
                imageUrl: product.imageUrls[1],
                fit: BoxFit.cover,
              ),
            ),
            ListView.builder(
              itemCount: 50,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const ListTile(
                title: Text('data'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
