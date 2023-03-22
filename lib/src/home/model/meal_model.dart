import 'dart:convert';
import 'item_model.dart';

class MealModel {
  final String id;
  final String name;
  final int hour;
  final int minutes;
  final List<ItemModel> items;

  MealModel({
    required this.id,
    required this.name,
    required this.hour,
    required this.minutes,
    required this.items,
  });

  factory MealModel.fromMap(Map<String, dynamic> map) => MealModel(
        id: map['id'],
        name: map['name'],
        hour: int.tryParse(map['hour'].toString()) ?? 0,
        minutes: int.tryParse(map['minutes'].toString()) ?? 0,
        items: (map['items'] as List<dynamic>)
            .map(
              (e) => ItemModel.fromMap(e),
            )
            .toList(),
      );

  factory MealModel.fromJson(String jsonString) => MealModel.fromMap(
        json.decode(jsonString),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'hour': hour,
        'minutes': minutes,
        'items': List<dynamic>.from(items.map((item) => item.toMap())),
      };

  String toJson() => json.encode(toMap());
}
