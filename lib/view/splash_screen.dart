import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_example/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState

    // fungsi untuk berpindah halaman
    splashScreen.isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text(
          "welcome_back".tr,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// import 'package:mvvm_example/data/app_exceptions.dart';
// import 'package:mvvm_example/res/assets/image_assets.dart';
// import 'package:mvvm_example/res/components/general_exception_widget.dart';
// import 'package:mvvm_example/res/components/internet_exception_widget.dart';
// import 'package:mvvm_example/res/components/round_button.dart';
// import 'package:mvvm_example/utils/utils.dart';
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('email_hint'.tr),
//       ),
//       body: Column(
//         children: [
//           RoundButton(
//             title: "Login",
//             width: 200,
//             onPress: () {},
//             loading: true,
//           ),
//           RoundButton(title: "Signup", width: double.infinity, onPress: () {})
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton(onPressed: () {
//       //   // throw InternetException("Internet Error");
//       //   Utils.toastMessage("Fandi aziz");
//       //   Utils.toastMessageCenter("Fandi aziz");
//       // }),
//     );
//   }
// }
