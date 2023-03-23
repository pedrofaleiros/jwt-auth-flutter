import 'package:authentication/src/home/controller/home_controller.dart';
import 'package:authentication/src/home/view/components/meal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealsList extends StatelessWidget {
  const MealsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (_, controller, __) => ListView.builder(
        itemCount: controller.userMeals.length,
        itemBuilder: (_, index) => Meal(
          meal: controller.userMeals[index],
        ),
      ),
    );
  }
}
