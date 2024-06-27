import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/core/presentation/utils/sized_box_extensions.dart';

import '../favorites/controller/favorites_controller.dart';
import 'controller/home_controller.dart';
import 'widgets/contact_us.dart';
import 'widgets/home_appbar.dart';

import 'widgets/home_discounts.dart';

import 'widgets/home_section_text.dart';
import 'widgets/installment_section.dart';
import 'widgets/offer_section.dart';
import 'widgets/popular_categories.dart';
import 'widgets/popular_products.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.find<HomeController>();

  final favoritesController = Get.find<FavoritesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            12.kH,
            HomeDiscounts(controller: controller),
            const HomeSectionText(text: 'Популярные категории'),
            PopularCategories(controller: controller),
            const HomeSectionText(text: 'Хиты продаж'),
            PopularProducts(controller: controller),
            12.kH,
            const InstallmentSection(),
            const HomeSectionText(text: 'Лучшие предложения'),
            12.kH,
            const OfferSection(),
            12.kH,
            asfs
            af
            sa
            f
            
            
            f
            as
            fas
            const ContactUs(),
            12.kH,
          ],
        ),
      ),
    );
  }
}
