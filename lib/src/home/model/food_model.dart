import 'dart:convert';

class FoodModel {
  final String id;
  final String name;
  final double kcal;
  final double carb;
  final double prot;
  final double fat;
  final double fiber;
  final bool liquid;

  FoodModel({
    required this.id,
    required this.kcal,
    required this.carb,
    required this.prot,
    required this.fat,
    required this.fiber,
    required this.name,
    required this.liquid,
  });

  FoodModel copyWith({
    String? id,
    double? kcal,
    double? carb,
    double? prot,
    double? fat,
    double? fiber,
    String? name,
    bool? liquid,
  }) {
    return FoodModel(
      id: id ?? this.id,
      kcal: kcal ?? this.kcal,
      carb: carb ?? this.carb,
      prot: prot ?? this.prot,
      fat: fat ?? this.fat,
      fiber: fiber ?? this.fiber,
      name: name ?? this.name,
      liquid: liquid ?? this.liquid,
    );
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) => FoodModel(
        id: map['id'],
        name: map['name'],
        kcal: double.tryParse(map['kcal'].toDouble().toString()) ?? 0,
        carb: double.tryParse(map['carb'].toDouble().toString()) ?? 0,
        prot: double.tryParse(map['prot'].toDouble().toString()) ?? 0,
        fat: double.tryParse(map['fat'].toDouble().toString()) ?? 0,
        fiber: double.tryParse(map['fiber'].toDouble().toString()) ?? 0,
        liquid: map['liquid'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'kcal': kcal,
        'carb': carb,
        'prot': prot,
        'fat': fat,
        'fiber': fiber,
        'liquid': liquid,
      };

  factory FoodModel.fromJson(String src) => FoodModel.fromMap(
        json.decode(src),
      );

  String toJson() => json.encode(toMap());
}
