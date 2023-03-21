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
  final _userKey = 'UserData';

  @override
  Future<Map<String, dynamic>> login(AuthRequestModel req) async {
    try {
      final Response res = await Dio().post(
        '$url$loginUrl',
        data: req.toMap(),
      );

      return res.data;
    } on DioError catch (e) {
      final Response<dynamic> error = e.response!;

      final data = json.decode(error.toString()) as Map<String, dynamic>;

      throw AuthException(data['error'].toString());
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
