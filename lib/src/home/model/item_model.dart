import 'dart:convert';

import 'food_model.dart';

class ItemModel {
  final String id;
  final int amount;
  final FoodModel food;

  ItemModel({
    required this.id,
    required this.amount,
    required this.food,
  });

  factory ItemModel.fromMap(Map<String, dynamic> map) => ItemModel(
        id: map['id'],
        amount: int.tryParse(map['amount'].toString()) ?? 0,
        food: FoodModel.fromMap(map['food']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'amount': amount,
        'food': food.toMap(),
      };

  factory ItemModel.fromJson(String src) => ItemModel.fromMap(
        json.decode(src),
      );

  String toJson() => json.encode(toMap());
}
