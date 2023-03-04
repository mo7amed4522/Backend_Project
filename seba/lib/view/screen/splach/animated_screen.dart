import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ye_detiction/controller/splace_controller/splace_controller.dart';
import 'package:ye_detiction/core/constant/link_phtot.dart';
import 'package:ye_detiction/core/theme/theme_color.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplachScreenControllerIMP>(
      init: SplachScreenControllerIMP(),
      builder:(controller)=> Scaffold(
        backgroundColor: AppColor.backgroungRegister,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColor.backgroungRegister,
        ),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Lottie.asset(
            AppLinkImage.eyejson,
            height: Get.height,
            width: Get.width
          ),
        ),
      ),
    );
  }
}
