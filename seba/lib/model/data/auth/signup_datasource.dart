

import 'package:ye_detiction/core/constant/curd.dart';
import 'package:ye_detiction/core/constant/link_api.dart';

class SignupData {
  Crud curd;
  SignupData(this.curd);

  postData(String name, String email, String password,String phoneNumber) async {
    var response = await curd.postRequest(AppLink.signUpLink, {
      "username": name,
      "email": email,
      "password": password,
      "phoneNumber":phoneNumber
    });
    return response;
  }
}
