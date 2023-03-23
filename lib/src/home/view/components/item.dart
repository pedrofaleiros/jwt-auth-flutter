import 'package:authentication/src/home/model/item_model.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.item,
  });

  final ItemModel item;

  TextStyle get _style => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.food.name),
      subtitle:
          Text(item.food.liquid ? '${item.amount} ml' : '${item.amount} g'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${(item.food.kcal / 100 * item.amount).toStringAsFixed(0)} Kcal',
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
                content:
                    'C: ${(item.food.carb / 100 * item.amount).toStringAsFixed(0)}',
                style: _style.copyWith(color: Color(0xffea4335)),
              ),
              const SizedBox(
                width: 10,
              ),
              MacrosText(
                content:
                    'P: ${(item.food.prot / 100 * item.amount).toStringAsFixed(0)}',
                style: _style.copyWith(color: Color(0xff1a73e8)),
              ),
              const SizedBox(
                width: 10,
              ),
              MacrosText(
                content:
                    'F: ${(item.food.fat / 100 * item.amount).toStringAsFixed(0)}',
                style: _style.copyWith(color: Color(0xffffc904)),
              ),
            ],
          ),
        ],
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
