import 'dart:async';

import 'package:get/route_manager.dart';
import 'package:mvvm_example/res/routes/routes_name.dart';
import 'package:mvvm_example/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  // pengecekan apakah user sudah login atau belum
  void isLogin() {
    userPreference.getUser().then((value) {
      print("Token: ${value.token}");
      print("isLogin: ${value.isLogin.toString()}");
      // jika token kosong
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.loginView));
      } else {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.homeView));
      }
    });
  }
}
