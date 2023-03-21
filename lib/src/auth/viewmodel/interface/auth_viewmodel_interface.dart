import 'package:authentication/src/auth/model/auth_request_model.dart';
import 'package:authentication/src/auth/model/user_model.dart';

abstract class AuthViewModelInterface {
  Future<Map<String, dynamic>> login(AuthRequestModel req);

  Future<Map<String, dynamic>> signup(SignupRequestModel req);

  Future<bool> setUser(UserModel user);

  Future<UserModel?> getUser();

  Future<bool> removeUser();
}
