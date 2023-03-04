// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ye_detiction/controller/tab_bar_view_controller.dart';
import 'package:ye_detiction/core/constant/const.dart';
import 'package:ye_detiction/core/constant/link_phtot.dart';
import 'package:ye_detiction/core/theme/theme_color.dart';
import 'package:ye_detiction/view/screen/auth/login_screen.dart';
import 'package:ye_detiction/view/screen/auth/register_screen.dart';

class TabBarViewScreen extends StatelessWidget {
  const TabBarViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabBarViewScreenControllerIMP>(
      init: TabBarViewScreenControllerIMP(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.nearlyWhite,
        appBar: AppBar(
          backgroundColor: AppColor.nearlyWhite,
          elevation: 0.0,
          toolbarHeight: 200,
          centerTitle: true,
          title: SvgPicture.asset(
            AppLinkImage.logoImage,
            width: Get.width,
            height: 150,
          ),
          bottom: TabBar(
            controller: controller.tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: AppColor.defaultColor,
            labelColor: AppColor.defaultColor,
            tabs: [
              Tab(
                text: "Sign In",
              ),
              Tab(
                text: "Sign UP",
              ),
            ],
          ),
        ),
        body: Navigator(
          key: navKey,
          onGenerateRoute: (_) => MaterialPageRoute(
              builder: (_) => TabBarView(
                    controller: controller.tabController,
                    children: [LoginScreen(), RegisterScreen()],
                  )),
        ),
      ),
    );
  }
}
