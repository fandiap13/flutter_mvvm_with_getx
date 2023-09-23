import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:mvvm_example/res/colors/app_color.dart';

class Utils {
  // context: konteks dari widget saati ini yang digunakan untuk mengelola element aplikasi
  // current: input saat ini yang kehilangan fokus
  // nextFocus: input berikutnya yang akan mendapatkan fokus
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    // Ketika metode ini dipanggil, ia akan memanggil unfocus() pada elemen input saat ini untuk melepaskan fokus dari elemen tersebut,
    current.unfocus();
    // kemudian meminta fokus pada elemen input berikutnya
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // pesan toast
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.blackColor,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG);
  }

  // pesan toast
  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.blackColor,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG);
  }

  // Metode ini menggunakan dependensi pihak ketiga GetX untuk menampilkan snackbar. Metode ini menerima dua parameter: judul snackbar (title) dan pesan snackbar (message). Saat dipanggil, ia akan menampilkan snackbar dengan judul dan pesan yang diterima.
  static snackBar(String title, String message) {
    Get.snackbar(title, message);
  }
}
