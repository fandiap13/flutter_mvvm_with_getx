import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_example/res/components/round_button.dart';
import 'package:mvvm_example/utils/utils.dart';
import 'package:mvvm_example/view_models/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("login".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  controller: loginVM.emailController.value,
                  focusNode: loginVM.emailFocusNode.value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      Utils.snackBar("Email", "Enter your email!");
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context,
                        loginVM.emailFocusNode.value,
                        loginVM.passwordFocusNode.value);
                  },
                  decoration: InputDecoration(
                      hintText: "email_hint".tr,
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: loginVM.passwordController.value,
                  focusNode: loginVM.passwordFocusNode.value,
                  obscureText: true,
                  obscuringCharacter: "a",
                  validator: (value) {
                    if (value!.isEmpty) {
                      Utils.snackBar("Password", "Enter your password!");
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    // Utils.fieldFocusChange(
                    //     context,
                    //     loginVM.emailFocusNode.value,
                    //     loginVM.passwordFocusNode.value);
                  },
                  decoration: InputDecoration(
                      hintText: "password_hint".tr,
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                // pakai obx agar selalu diawasi perubahannya secara realtime
                Obx(() => RoundButton(
                    width: 200,
                    title: "login".tr,
                    loading: loginVM.loading.value,
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        loginVM.loginApi();
                      }
                    }))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
