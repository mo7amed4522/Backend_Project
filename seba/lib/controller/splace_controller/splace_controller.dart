// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:get/get.dart';
import 'package:ye_detiction/core/route/routes.dart';

abstract class SplachScreenController extends GetxController {}

class SplachScreenControllerIMP extends SplachScreenController {
  @override
  void onInit() {
    
    Timer( Duration(seconds: 6), () {
      Get.toNamed(AppRoute.tabar);
    });
    super.onInit();
  }
}
