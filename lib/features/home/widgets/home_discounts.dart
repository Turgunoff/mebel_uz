import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/core/presentation/utils/sized_box_extensions.dart';
import 'package:mebel_uz/features/home/controller/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeDiscounts extends StatelessWidget {
  const HomeDiscounts({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.isTrue) {
        return const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
            child: CupertinoActivityIndicator(
              radius: 10,
              animating: true,
            ),
          ),
        );
      }
      return Column(
        children: [
          CarouselSlider(
            carouselController: CarouselController(),
            items: controller.discounts
                .map((item) => ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        imageUrl: item.image,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(
                            radius: 10,
                            animating: true,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.9,
              scrollPhysics: const ScrollPhysics(),
              onPageChanged: controller.onPageChanged,
            ),
          ),
          8.kH,
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex:
                  controller.carouselIndex, // Get index from controller
              count: controller.discounts.length,
              effect: WormEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  spacing: 6,
                  dotColor: Colors.grey,
                  activeDotColor: Theme.of(context).primaryColor),
            ),
          )
        ],
      );
    });
  }
}
