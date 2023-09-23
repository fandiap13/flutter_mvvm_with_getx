import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_example/models/login/user_model.dart';
import 'package:mvvm_example/repository/login_repository/login_repository.dart';
import 'package:mvvm_example/res/routes/routes_name.dart';
import 'package:mvvm_example/utils/utils.dart';
import 'package:mvvm_example/view_models/controller/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  // memanggil userpreverence()
  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  // menggunakan deklarasi variabel dari get
  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    // print(data);
    _api.loginApi(data).then((value) {
      print(value);
      if (value['error'] == 'user not found') {
        Utils.snackBar("Login", value['error']);
      } else {
        UserModel userModel = UserModel(token: value['token'], isLogin: true);

        // menyimpan hasil login ke session
        userPreference.saveUser(userModel).then((value) {
          Get.toNamed(RouteName.homeView);
        }).onError((error, stackTrace) {});

        Utils.snackBar("Login", "Login successfully");
      }
      loading.value = false;
    }).onError((error, stackTrace) {
      loading.value = false;
      print(error.toString());
      Utils.snackBar("Error", error.toString());
    });
  }
}
