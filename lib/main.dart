import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mebel_uz/firebase_options.dart';
import 'package:mebel_uz/models/product_hive_model.dart';
import 'package:mebel_uz/models/product_model.dart';
import 'package:mebel_uz/screens/splash/splash_screen.dart';

void main() async {
  // Hive'ni init qilish
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductHiveModelAdapter());
    await Hive.openBox<ProductModel>('favorites');
  } catch (e) {
    print('Hiveni ishga tushirishda xatolik: $e');
  }

  WidgetsFlutterBinding.ensureInitialized(); // Flutterni ishga tushirish

  // Firebase'ni init qilish
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.appAttest,
    );
  } catch (e) {
    print('Firebase ni ishga tushirishda xatolik: $e');
  }

  // Tizim UI Overlay stilini sozlash
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mebel uz',
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
      home: const SplashScreen(),
    );
  }
}
