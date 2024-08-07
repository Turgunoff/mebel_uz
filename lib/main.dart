import 'dart:developer';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mebel_uz/core/presentation/routes/app_pages.dart';
import 'package:mebel_uz/core/presentation/routes/app_routes.dart';
import 'package:mebel_uz/firebase_options.dart';

import 'app/bindings/app_binding.dart';
import 'core/presentation/localization/app_localization.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );

  final messaging = FirebaseMessaging.instance;
  messaging.getToken().then((token) => log(token ?? 'No token found'));

  // Hive'ni ishga tushirish
  await Hive.initFlutter();
  // Box adapterini ro'yxatga olish (agar kerak bo'lsa)
  // Hive.registerAdapter(ProductModelAdapter()); // Agar ProductModel'ni saqlamoqchi bo'lsangiz

  // Sevimlilar uchun box ochish
  await Hive.openBox<String>('favorites');

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mebel uz',
      initialRoute: AppRoutes.splash, // Boshlang'ich route nomi
      getPages: AppPages.pages, // Barcha GetPage'lar ro'yxati
      initialBinding: AppControllerBinding(),
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: const Locale('uz', 'UZ'),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF013C7E),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF013C7E),
        ),
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
          backgroundColor:
              Color(0xFFFAFAFA), // Set your desired background color
          elevation: 2, // Remove any default elevation
          titleTextStyle: TextStyle(
            color: Colors.black, // Adjust title text color
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
