import 'dart:convert';

import 'package:authentication/src/auth/model/auth_exception.dart';
import 'package:authentication/src/auth/model/auth_request_model.dart';
import 'package:authentication/src/auth/model/user_model.dart';
import 'package:authentication/src/auth/viewmodel/interface/auth_viewmodel_interface.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel implements AuthViewModelInterface {
  final url = 'http://172.30.129.176:3333';
  final loginUrl = '/session';
  final signupUrl = '/user';
  final _userKey = 'UserData';

  @override
  Future<Map<String, dynamic>> login(AuthRequestModel req) async {
    try {
      print('tentando requisicao');

      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 3);
      dio.options.sendTimeout = const Duration(seconds: 3);

      final Response res = await dio.post(
        '$url$loginUrl',
        data: req.toMap(),
      );

      return res.data;
    } on DioError catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  AuthException handleDioError(DioError e) {
    if (e.type == DioErrorType.connectionTimeout) {
      return AuthException('Tempo excedido');
    }

    final Response<dynamic> error = e.response!;
    final data = json.decode(error.toString()) as Map<String, dynamic>;
    return AuthException(data['error'].toString());
  }

  @override
  Future<Map<String, dynamic>> signup(SignupRequestModel req) async {
    try {

      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 3);
      dio.options.sendTimeout = const Duration(seconds: 3);

      final Response res = await dio.post(
        '$url$signupUrl',
        data: req.toMap(),
      );

      return res.data;
    } on DioError catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<bool> setUser(UserModel user) async {
    final shared = await SharedPreferences.getInstance();

    return await shared.setString(_userKey, user.toJson());
  }

  @override
  Future<UserModel?> getUser() async {
    final shared = await SharedPreferences.getInstance();

    final user = shared.getString(_userKey);

    if (user != null) {
      final jsonUser = json.decode(user);

      return UserModel.fromMap(jsonUser);
    }

    return null;
  }

  @override
  Future<bool> removeUser() async {
    final shared = await SharedPreferences.getInstance();

    return await shared.clear();
  }
}
