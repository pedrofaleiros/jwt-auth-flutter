import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:authentication/src/home/controller/food_controller.dart';
import 'package:authentication/src/home/view/components/food.dart';
import 'package:authentication/src/home/view/pages/edit_food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodsPage extends StatelessWidget {
  const FoodsPage({super.key});

  static const routeName = '/foods';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, EditFoodPage.routeName);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<FoodController>(
          builder: (_, controller, __) => ListView.builder(
            itemCount: controller.foods.length,
            itemBuilder: (_, index) => Food(
              food: controller.foods[index],
            ),
          ),
        ),
      ),
    );
  }
}
