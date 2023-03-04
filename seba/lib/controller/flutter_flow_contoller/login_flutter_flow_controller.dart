
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:ye_detiction/model/model/data_flow.dart';

abstract class FlutterFlowLoginPageController extends GetxController
    with GetTickerProviderStateMixin {}

class FlutterFlowLoginPageControllerIMP extends FlutterFlowLoginPageController {
  late LoginPageModel model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
      //  model = createModel(context, () => LoginPageModel());

    model.emailAddressController ??= TextEditingController();
    model.passwordController ??= TextEditingController();
    model.emailAddressCreateController ??= TextEditingController();
    model.passwordCreateController ??= TextEditingController();
  }

  @override
  void dispose() {
    model.dispose();
    unfocusNode.dispose();
    super.dispose();
  }
}
