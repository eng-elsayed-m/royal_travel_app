// import 'package:http/http.dart' as http;

import 'package:royal_travel/model/api/app_exception.dart';

class AuthService {
  Future<bool> sendLoginRequest(String email, String password) async {
    print("Start Logging");
    final bool isValid = _validateResponse(email, password);
    await Future.delayed(Duration(seconds: 1));
    if (!isValid) {
      throw InvalidInputException("Something Wrong");
    }
    print("End Logging");
    return isValid;
  }

  bool _validateResponse(String email, String password) {
    // if (email != "email" || password != "password") {
    //   return false;
    // }
    return true;
  }
}
