import 'package:royal_travel/model/auth/auth_service.dart';

class AuthRepository {
  final _authService = AuthService();
  Future<bool?> fetchLoginRespone(String email, String password) async {
    return _authService
        .sendLoginRequest(email, password)
        .catchError((error) => throw error);
  }
}
