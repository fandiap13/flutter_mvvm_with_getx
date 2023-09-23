import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_example/res/colors/app_color.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;

  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.16,
          ),
          const Icon(
            Icons.cloud_off,
            color: AppColor.redColor,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
                child: Text(
              "internet_exception".tr,
              textAlign: TextAlign.center,
            )),
          ),
          SizedBox(
            height: size.height * 0.16,
          ),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text(
                'Retry',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
