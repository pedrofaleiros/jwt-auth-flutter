import 'package:authentication/src/home/model/food_model.dart';
import 'package:authentication/src/home/model/home_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FoodController with ChangeNotifier {
  List<FoodModel> _foods = [];
  List<FoodModel> get foods => [..._foods];

  FoodModel foodToAdd = FoodModel(
    id: '',
    kcal: 0,
    carb: 0,
    prot: 0,
    fat: 0,
    fiber: 0,
    name: '',
    liquid: false,
  );

  Future<void> searchFoods(String userToken, String search) async {
    try {
      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 5);
      dio.options.sendTimeout = const Duration(seconds: 5);

      final Response res = await Dio().get(
        'http://172.30.129.176:3333/food/search?name=$search',
        options: Options(headers: {
          'Authorization': 'Bearer ${userToken}',
        }),
      );

      print(res.data);
      final lista = res.data as List<dynamic>;

      List<FoodModel> foods =
          lista.map((food) => FoodModel.fromMap(food)).toList();

      _foods = foods;
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future<void> loadFoods(String userToken) async {
    try {
      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 5);
      dio.options.sendTimeout = const Duration(seconds: 5);

      final Response res = await Dio().get(
        'http://172.30.129.176:3333/food',
        options: Options(headers: {
          'Authorization': 'Bearer ${userToken}',
        }),
      );

      print(res.data);
      final lista = res.data as List<dynamic>;

      List<FoodModel> foods =
          lista.map((food) => FoodModel.fromMap(food)).toList();

      _foods = foods;
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future<String?> addFood(String userToken) async {
    String? ret;

    try {
      validate();

      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 5);
      dio.options.sendTimeout = const Duration(seconds: 5);

      final Response res = await Dio().post(
        'http://172.30.129.176:3333/food',
        data: foodToAdd.toMap(),
        options: Options(headers: {
          'Authorization': 'Bearer ${userToken}',
        }),
      );

      await loadFoods(userToken);

      foodToAdd = FoodModel(
        id: '',
        name: '',
        kcal: 0,
        carb: 0,
        prot: 0,
        fat: 0,
        fiber: 0,
        liquid: false,
      );
    } catch (e) {
      print(e.toString());
      ret = e.toString();
    }

    notifyListeners();
    return ret;
  }

  void validate() {
    if (foodToAdd.name == '') {
      throw HomeException('invalid name');
    }
    if (foodToAdd.kcal < 0) {
      throw HomeException('invalid kcal');
    }
    if (foodToAdd.carb < 0) {
      throw HomeException('invalid carb');
    }
    if (foodToAdd.prot < 0) {
      throw HomeException('invalid prot');
    }
    if (foodToAdd.fat < 0) {
      throw HomeException('invalid fat');
    }
    if (foodToAdd.fiber < 0) {
      throw HomeException('invalid fiber');
    }
  }
}
