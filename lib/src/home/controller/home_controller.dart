import 'package:authentication/src/auth/model/user_model.dart';
import 'package:authentication/src/home/model/meal_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  List<MealModel> _userMeals = [];
  List<MealModel> get userMeals => [..._userMeals];

  set userMeals(List<MealModel> meals) {
    _userMeals = meals;
  }

  UserModel _user = UserModel(
    id: '',
    name: '',
    email: '',
    token: '',
  );

  set user(UserModel newUser) {
    _user = newUser;
  }

  String get userToken => _user.token;

  Future<void> loadMeals() async {
    try {
      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 3);
      dio.options.sendTimeout = const Duration(seconds: 3);

      final Response res = await Dio().get(
        'http://172.30.129.176:3333/meal',
        options: Options(headers: {
          'Authorization': 'Bearer ${userToken}',
        }),
      );

      final lista = res.data as List<dynamic>;

      List<MealModel> userMeals =
          lista.map((meal) => MealModel.fromMap(meal)).toList();

      _userMeals = userMeals;
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }
}
