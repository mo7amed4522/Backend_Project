// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ye_detiction/controller/Binding/initial_bindings.dart';
import 'package:ye_detiction/core/route/app_route.dart';
import 'package:ye_detiction/core/server/server.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter',
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}
