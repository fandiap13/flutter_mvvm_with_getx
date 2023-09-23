import 'package:mvvm_example/data/network/network_api_services.dart';
import 'package:mvvm_example/res/app_url/app_url.dart';

class LoginRepository {
  // memanggil layanan api dari file network_api_service.dart
  // fungsinya untuk menggunakan post, get, put, delete
  final _apiService = NetworkApiSerivices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
}
