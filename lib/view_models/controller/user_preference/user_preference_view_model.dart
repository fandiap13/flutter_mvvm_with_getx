import 'package:mvvm_example/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// share preference untuk memanagement session milik user
// Ini adalah kelas yang digunakan untuk mengelola preferensi pengguna, seperti menyimpan, mengambil, dan menghapus data sesi pengguna

// Dalam konteks penggunaan nyata, Anda dapat menggunakan kelas UserPreference ini untuk menyimpan token pengguna saat login, mengambil token saat diperlukan (misalnya, untuk mengakses API yang memerlukan token), dan menghapus token saat pengguna logout. Ini adalah cara yang umum digunakan untuk mengelola data sesi pengguna di aplikasi Flutter atau Dart yang berinteraksi dengan penyimpanan lokal.

class UserPreference {
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", responseModel.token.toString());
    sp.setBool("isLogin", responseModel.isLogin!);

    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token");
    bool? isLogin = sp.getBool("isLogin");

    // return dalam bentuk json
    return UserModel(token: token, isLogin: isLogin);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();

    return true;
  }
}
