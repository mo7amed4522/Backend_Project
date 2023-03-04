
import 'package:get/get.dart';
import 'package:ye_detiction/core/middleware/my_middleware.dart';
import 'package:ye_detiction/core/route/routes.dart';
import 'package:ye_detiction/view/screen/auth/login_screen.dart';
import 'package:ye_detiction/view/screen/auth/register_screen.dart';
import 'package:ye_detiction/view/screen/splach/animated_screen.dart';
import 'package:ye_detiction/view/screen/tab_bar_view.dart';

List<GetPage<dynamic>>? routes = [
  // =========== Auth =========//
  GetPage(
      name: AppRoute.start,
      page: () => const SplachScreen(),
      middlewares: [MyMiddleWare()]),
      GetPage(
      name: AppRoute.tabar,
      page: () => const TabBarViewScreen(),
      ),
      // =========== Login =========//
      GetPage(
      name: AppRoute.login,
      page: () => const LoginScreen(),
      ),
      GetPage(
      name: AppRoute.registerPage,
      page: () => const RegisterScreen(),
      ),
];