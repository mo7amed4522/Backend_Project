// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ye_detiction/core/theme/theme_color.dart';

Widget defaultTextForm(
        {required TextEditingController controller,
        required TextInputType keyboardType,
        required String label,
        bool formEnable = true,
        bool readOnly = false,
        IconData? prefix,
        IconData? suffix,
        Function? suffixPress,
        Function? onSubmit,
        Function? onChange,
        Function? onTap,
        int? maxLength,
        int maxLines = 1,
        required color,
        required Function validate,
        bool isPassword = false}) =>
    Container(
        decoration: BoxDecoration(
          color: AppColor.containerWidget,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 60,
        width: Get.width,
        child: Row(children: [
          SizedBox(
              width: 3,
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.defaultColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))))),

          SizedBox(
              height: 70,
              width: Get.width / 1.2,
              child: TextFormField(
                  style: TextStyle(color: color),
                  maxLength: maxLength,
                  maxLines: maxLines,
                  readOnly: readOnly,
                  obscureText: isPassword,
                  enabled: formEnable,
                  controller: controller,
                  keyboardType: keyboardType,
                  onTap: () {
                    onTap!();
                  },
                  onFieldSubmitted: (value) {
                    onSubmit!(value);
                  },
                  onChanged: (value) {
                    onChange!(value);
                  },
                  validator: (s) {
                    return validate(s);
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.0, color: AppColor.backgroungRegister),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColor.backgroungRegister, width: 0.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.0, color: AppColor.backgroungRegister),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.0, color: AppColor.backgroungRegister),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.0, color: AppColor.backgroungRegister),
                      ),
                      errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(color: AppColor.defaultColor),
                      labelText: label,
                      suffixIcon: suffix != null
                          ? IconButton(
                              onPressed: () {
                                suffixPress!();
                              },
                              icon: Icon(suffix, color: AppColor.nearlyBlue))
                          : null)))
        ]));

Widget animatedOptacity(String text) {
  return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: 0.99,
      child: Padding(
          padding: const EdgeInsets.only(left: 40, bottom: 16, right: 40),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColor.buttonColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Center(
                            child: Text(
                                text,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                color: AppColor.nearlyWhite,
                                //fontFamily: "Poppins",
                                fontSize: 20
                                ),
                                ))))
              ])));
}
