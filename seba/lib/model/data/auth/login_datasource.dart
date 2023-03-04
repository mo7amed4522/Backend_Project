

import 'package:ye_detiction/core/constant/curd.dart';
import 'package:ye_detiction/core/constant/link_api.dart';

class SigninData {
  Crud curd;
  SigninData(this.curd);

  postData(String email, String password) async {
    var response = await curd.postRequest(
      AppLink.signinLink,
      {
        "email": email,
        "password": password,
      },
    );

    return response.fold((l) => l, (r) => r);
  }
}
