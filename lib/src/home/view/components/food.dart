import 'package:authentication/src/home/model/food_model.dart';
import 'package:flutter/material.dart';

class Food extends StatelessWidget {
  const Food({
    super.key,
    required this.food,
  });

  final FoodModel food;

  TextStyle get _style => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(food.name),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${(food.kcal).toStringAsFixed(0)} Kcal',
              style: _style.copyWith(
                  color: Color(
                    0xff45c8bd,
                  ),
                  fontSize: 14),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MacrosText(
                  content: 'C: ${(food.carb).toStringAsFixed(0)}',
                  style: _style.copyWith(color: Color(0xffea4335)),
                ),
                const SizedBox(
                  width: 10,
                ),
                MacrosText(
                  content: 'P: ${(food.prot).toStringAsFixed(0)}',
                  style: _style.copyWith(color: Color(0xff1a73e8)),
                ),
                const SizedBox(
                  width: 10,
                ),
                MacrosText(
                  content: 'F: ${(food.fat).toStringAsFixed(0)}',
                  style: _style.copyWith(color: Color(0xffffc904)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MacrosText extends StatelessWidget {
  const MacrosText({
    super.key,
    required this.content,
    required TextStyle style,
  }) : _style = style;

  final String content;
  final TextStyle _style;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: _style,
    );
  }
}
