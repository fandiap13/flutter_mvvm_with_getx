import 'package:get/get.dart';
import 'package:mvvm_example/data/response/status.dart';
import 'package:mvvm_example/models/home/user_list_model.dart';
import 'package:mvvm_example/repository/home_respository/home_repository.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();
  RxString error = "".obs;
  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;

  void setRxResquestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  void setUserList(UserListModel value) {
    userList.value = value;
  }

  void setError(String value) {
    error.value = value;
  }

  void userListApi() {
    _api.userListApi().then((value) {
      setRxResquestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      // print("================");
      // print(error);
      // print(stackTrace);
      // print("================");
      setError(error.toString());
      setRxResquestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    // mengubah status menjadi loading
    setRxResquestStatus(Status.LOADING);

    _api.userListApi().then((value) {
      setRxResquestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxResquestStatus(Status.ERROR);
    });
  }
}
