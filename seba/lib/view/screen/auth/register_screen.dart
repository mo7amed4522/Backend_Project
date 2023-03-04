// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ye_detiction/controller/tab_bar_view_controller.dart';
import 'package:ye_detiction/core/constant/companent.dart';
import 'package:ye_detiction/core/func/validationinput.dart';
import 'package:ye_detiction/core/theme/theme_color.dart';
import 'package:ye_detiction/view/widget/auth_widget/drop_mnue_item_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    return GetBuilder<TabBarViewScreenControllerIMP>(
      init: TabBarViewScreenControllerIMP(),
      builder: (controller) => Scaffold(
        body: Sizer(
          builder: (context, orientation, deviceType) => SizedBox(
            child: ListView(
              children: [
                Form(
                  key: formState,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.w),
                    child: Column(
                      children: [
                        defaultTextForm(
                          controller: controller.userNameController,
                          onChange: (Value) {},
                          onSubmit: (value) {},
                          onTap: () {},
                          validate: (value) {
                            return validInput(value, 7, 20, "Username");
                          },
                          label: "UserName",
                          keyboardType: TextInputType.emailAddress,
                          color: AppColor.black,
                        ),
                        SizedBox(height: 1.h),
                        defaultTextForm(
                          controller: controller.emailController,
                          onChange: (Value) {},
                          onSubmit: (value) {},
                          onTap: () {},
                          validate: (value) {
                            return validInput(value, 7, 20, "email");
                          },
                          label: "Email",
                          keyboardType: TextInputType.emailAddress,
                          color: AppColor.black,
                        ),
                        SizedBox(height: 1.h),
                        defaultTextForm(
                          controller: controller.passwordController,
                          onChange: (Value) {},
                          onSubmit: (value) {},
                          onTap: () {},
                          validate: (value) {
                            return validInput(value, 7, 20, "password");
                          },
                          label: "Password",
                          keyboardType: TextInputType.emailAddress,
                          color: AppColor.black,
                        ),
                        SizedBox(height: 1.h),
                        defaultTextForm(
                          controller: controller.phoneController,
                          onChange: (Value) {},
                          
                          onSubmit: (value) {},
                          onTap: () {},
                          validate: (value) {
                            return validInput(value, 7, 20, "phone");
                          },
                          label: "Phone",
                          keyboardType: TextInputType.emailAddress,
                          color: AppColor.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DropMnueItemRegisterWidget(
                      value: controller.selectedLocation,
                      items: controller.locations.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        controller.changeDrpo(val!);
                      },
                    ),
                    SizedBox(
                      width: 30.w,
                      child: GestureDetector(
                        onTap: () {
                          if (formState.currentState!.validate()) {
                            controller.signUp();
                          } else {
                            Get.snackbar(
                              "error",
                              "you have add values",
                              snackPosition: SnackPosition.BOTTOM
                            );
                          }
                        },
                        child: animatedOptacity(
                          "Sgin Up",
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
