import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:authentication/src/home/controller/food_controller.dart';
import 'package:authentication/src/home/view/components/food.dart';
import 'package:authentication/src/home/view/pages/edit_food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class FoodsPage extends StatelessWidget {
  const FoodsPage({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            TextField(
              onChanged: (value) async {
                final userToken = context.read<AuthController>().userToken;
                if (userToken == null) {
                  return;
                }
                await context
                    .read<FoodController>()
                    .searchFoods(userToken, value);
              },
              decoration: const InputDecoration(
                labelText: 'Filtrar por nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Consumer<FoodController>(
              builder: (_, controller, __) => Expanded(
                child: ListView.builder(
                  itemCount: controller.foods.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: (){
                      print(controller.foods[index].id);
                    },
                    child: Food(
                      food: controller.foods[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
