// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ye_detiction/controller/tab_bar_view_controller.dart';
import 'package:ye_detiction/core/constant/companent.dart';
import 'package:ye_detiction/core/constant/link_phtot.dart';
import 'package:ye_detiction/core/theme/theme_color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabBarViewScreenControllerIMP>(
      init: TabBarViewScreenControllerIMP(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.nearlyWhite,
        appBar: AppBar(backgroundColor: AppColor.nearlyWhite, elevation: 0.0),
        body: Sizer(
          builder: (context, orientation, deviceType) => SizedBox(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.w),
                  height: 26.h,
                  child: ListView(
                    children: [
                      defaultTextForm(
                        controller: TextEditingController(),
                        onChange: (Value) {},
                        onSubmit: (value) {},
                        onTap: () {},
                        validate: (value) {},
                        label: "E-Mail",
                        keyboardType: TextInputType.emailAddress,
                        color: AppColor.backgroungRegister,
                      ),
                      SizedBox(height: 1.h),
                      defaultTextForm(
                        controller: controller.passwordController,
                        onChange: (Value) {},
                        onSubmit: (value) {},
                        onTap: () {},
                        validate: (value) {},
                        label: "Password",
                        keyboardType: TextInputType.emailAddress,
                        color: AppColor.backgroungRegister,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Password ?",
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                      child: GestureDetector(
                        onTap: () {},
                        child: animatedOptacity(
                          "Sgin In",
                        ),
                      ),
                    )
                  ],
                ),
               
                 Padding(
                  padding:  EdgeInsets.symmetric(vertical: 2.w,horizontal: 2.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AppLinkImage.google),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AppLinkImage.google),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AppLinkImage.google),
                      ),
                    ],
                  ),
                ), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
