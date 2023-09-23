import 'package:mvvm_example/data/network/network_api_services.dart';
import 'package:mvvm_example/models/home/user_list_model.dart';
import 'package:mvvm_example/res/app_url/app_url.dart';

class HomeRepository {
  // memanggil layanan api dari file network_api_service.dart
  // fungsinya untuk menggunakan post, get, put, delete
  final _apiService = NetworkApiSerivices();

  Future<dynamic> userListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}
