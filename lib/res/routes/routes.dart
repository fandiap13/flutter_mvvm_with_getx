import 'package:get/route_manager.dart';
import 'package:mvvm_example/res/routes/routes_name.dart';
import 'package:mvvm_example/view/home/home_view.dart';
import 'package:mvvm_example/view/splash_screen.dart';
import 'package:mvvm_example/view/login/login_view.dart';

class AppRoutes {
  // proses routing menggunakan getx

  // appRoutes(). Metode ini digunakan untuk mengembalikan daftar konfigurasi rute (routes) dalam aplikasi. Rute-rute ini akan digunakan untuk menentukan bagaimana aplikasi melakukan navigasi antara halaman-halaman (pages) yang berbeda.
  static appRoutes() => [
        // GetPage(...): Ini adalah konfigurasi rute menggunakan GetX. Di dalam daftar rute, Anda hanya memiliki satu rute yang didefinisikan menggunakan GetPage.
        GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashScreen(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.loginView,
          page: () => const LoginView(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.homeView,
          page: () => const HomeView(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
