// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ye_detiction/model/data/auth/signup_datasource.dart';

abstract class TabBarViewScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  changeDrpo(String value);
  signUp();
}

class TabBarViewScreenControllerIMP extends TabBarViewScreenController {
  TabController? tabController;
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  SignupData signupData = SignupData(Get.find());

  @override
  void onInit() {
    emailController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    tabController!.dispose();
    super.dispose();
  }

  String selectedLocation = "Doctor";
  List<String> locations = ['Doctor', 'Radiologist'];

  @override
  changeDrpo(String value) {
    selectedLocation = value;
    update();
  }

  @override
  signUp() async {
    var response = await signupData.postData(userNameController.text,
        emailController.text, passwordController.text, phoneController.text);
    Get.snackbar("data Come true", "your response seccess",
        snackPosition: SnackPosition.BOTTOM);
  }
}
