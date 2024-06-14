import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mebel_uz/core/presentation/utils/assets.dart';
import 'package:mebel_uz/features/navigation_menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _signInAnonymously(); // Anonim autentifikatsiyani boshlash
    // Timer(const Duration(seconds: 3), () => Get.offAll(() => NavigationMenu()));
  }

  Future<void> _signInAnonymously() async {
    try {
      await _auth.signInAnonymously();

      // Autentifikatsiyadan so'ng, NavigationMenu ga o'tish
      Timer(
        const Duration(seconds: 3),
        () => Get.offAll(() => NavigationMenu()),
      );
    } catch (e) {
      // Xatolikni qayta ishlash (loglash, snackbar yoki dialog ko'rsatish)
      print('Error signing in anonymously: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.assetsLogoSplashLogo,
              width: MediaQuery.sizeOf(context).width * 0.7,
            ),
          ],
        ),
      ),
    );
  }
}
