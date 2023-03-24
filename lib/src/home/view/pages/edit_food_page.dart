import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:authentication/src/home/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* 
{
  "name": "macarrao barilla",
  "kcal": 348,
  "carb":72.5,
  "prot": 11.4,
  "fat": 1.5,
  "fiber":0,
  "liquid": false
}
 */

class EditFoodPage extends StatelessWidget {
  const EditFoodPage({super.key});

  static const routeName = '/edit_food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  context.read<FoodController>().foodToAdd = context
                      .read<FoodController>()
                      .foodToAdd
                      .copyWith(name: value);
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Kcal'),
                onChanged: (value) {
                  context.read<FoodController>().foodToAdd = context
                      .read<FoodController>()
                      .foodToAdd
                      .copyWith(kcal: double.tryParse(value));
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Carboidratos'),
                onChanged: (value) {
                  context.read<FoodController>().foodToAdd = context
                      .read<FoodController>()
                      .foodToAdd
                      .copyWith(carb: double.tryParse(value));
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Proteinas'),
                onChanged: (value) {
                  context.read<FoodController>().foodToAdd = context
                      .read<FoodController>()
                      .foodToAdd
                      .copyWith(prot: double.tryParse(value));
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Gorduras'),
                onChanged: (value) {
                  context.read<FoodController>().foodToAdd = context
                      .read<FoodController>()
                      .foodToAdd
                      .copyWith(fat: double.tryParse(value));
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Fibras'),
                onChanged: (value) {
                  context.read<FoodController>().foodToAdd = context
                      .read<FoodController>()
                      .foodToAdd
                      .copyWith(fiber: double.tryParse(value));
                },
              ),
              OutlinedButton(
                onPressed: () async {
                  final userToken = context.read<AuthController>().userToken;

                  if (userToken == null) {
                    return;
                  }
                  context
                      .read<FoodController>()
                      .addFood(userToken)
                      .then((value) {
                    if (value == null) {
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(value),
                        ),
                      );
                    }
                  });
                },
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
