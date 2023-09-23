import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mvvm_example/res/getx_localization/languages.dart';
import 'package:mvvm_example/res/routes/routes.dart';
import 'package:mvvm_example/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // get material app adalah material milik getx
    return GetMaterialApp(
      title: 'MVVM Dasar',
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale("en", "US"),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
