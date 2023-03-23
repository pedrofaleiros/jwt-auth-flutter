import 'package:authentication/src/home/model/meal_model.dart';
import 'package:authentication/src/home/view/components/items_list.dart';
import 'package:flutter/material.dart';

import 'name_and_time.dart';

class Meal extends StatelessWidget {
  const Meal({
    super.key,
    required this.meal,
  });

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            NameAndTime(
              name: meal.name,
              hour: meal.hour,
              minutes: meal.minutes,
            ),
            ItemsList(items: meal.items),
            OutlinedButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
