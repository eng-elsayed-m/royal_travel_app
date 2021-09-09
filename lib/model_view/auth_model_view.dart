import 'package:flutter/foundation.dart';
import 'package:royal_travel/model/api/api_response.dart';
import 'package:royal_travel/model/auth/auth_repository.dart';

class AuthModelView extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial("Empty Date");
  bool? _isAuth = false;
  ApiResponse get response => _apiResponse;
  bool? get isAuth => _isAuth;
  Future<void> login(String email, String password) async {
    _apiResponse = ApiResponse.loading("Logging ...");
    notifyListeners();

    _isAuth =
        await AuthRepository().fetchLoginRespone(email, password).then((value) {
      _apiResponse = ApiResponse.complete(value);
    }).catchError((error) {
      _apiResponse = ApiResponse.error(error.toString());
    });

    notifyListeners();
  }
}
