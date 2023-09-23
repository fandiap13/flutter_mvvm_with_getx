import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_example/data/response/status.dart';
import 'package:mvvm_example/res/components/general_exception_widget.dart';
import 'package:mvvm_example/res/components/internet_exception_widget.dart';
import 'package:mvvm_example/res/routes/routes_name.dart';
import 'package:mvvm_example/view_models/controller/home/home_view_model.dart';
import 'package:mvvm_example/view_models/controller/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeViewModel());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    homeController.userListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Home Page"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  UserPreference()
                      .removeUser()
                      .then((value) => Get.toNamed(RouteName.loginView));
                },
                icon: const Icon(Icons.logout))
          ]),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            // print(homeController.error.value);
            if (homeController.error.value == "No Internet") {
              return InternetExceptionWidget(onPress: () {
                // memanggil api untuk memanggil data dari api
                homeController.refreshApi();
              });
            } else {
              return GeneralExceptionWidget(onPress: () {
                // memanggil api untuk memanggil data dari api
                homeController.refreshApi();
              });
            }
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(homeController
                          .userList.value.data![index].avatar
                          .toString()),
                    ),
                    title: Text(homeController
                        .userList.value.data![index].firstName
                        .toString()),
                    subtitle: Text(homeController
                        .userList.value.data![index].email
                        .toString()),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
