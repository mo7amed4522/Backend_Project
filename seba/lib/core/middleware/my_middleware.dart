// ignore_for_file: body_might_complete_normally_nullable, override_on_non_overriding_member

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ye_detiction/core/route/routes.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  @override
  RouteSettings? redicret() {
    return const RouteSettings(name: AppRoute.start);
  }
}
