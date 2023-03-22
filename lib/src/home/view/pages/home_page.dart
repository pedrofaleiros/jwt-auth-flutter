import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:authentication/src/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<HomeController>(context).loadMeals().then(
        (value) {
          setState(() {
            _isLoading = false;
          });
        },
      ).catchError((onError) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    _isInit = false;

    super.didChangeDependencies();
  }

  Widget get _loadingIndicator => const Center(
        child: CircularProgressIndicator(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async => context.read<AuthController>().logout(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      //TODO -----------------------------
      //componentizar widgets
      //
      //
      //
      body: _isLoading
          ? _loadingIndicator
          : Center(
              child: Consumer<HomeController>(
              builder: (_, controller, __) => ListView.builder(
                itemCount: controller.userMeals.length,
                itemBuilder: (_, index) {
                  final meal = controller.userMeals[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    meal.name,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    meal.minutes == 0
                                        ? '${meal.hour}:${meal.minutes}0'
                                        : '${meal.hour}:${meal.minutes}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              color: Colors.white.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: meal.items.length == 0
                                      ? [
                                          Container(
                                            width: double.infinity,
                                            height: 20,
                                            child: Text('Vazio'),
                                          ),
                                        ]
                                      : meal.items.map((item) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 4.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.food.name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 4.0),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        'Kcal: ${item.food.kcal}',
                                                      ),
                                                    ),
                                                    SizedBox(width: 8.0),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        'Prot: ${item.food.prot}',
                                                      ),
                                                    ),
                                                    SizedBox(width: 8.0),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        'Carb: ${item.food.carb}',
                                                      ),
                                                    ),
                                                    SizedBox(width: 8.0),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        'Fat: ${item.food.fat}',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )),
    );
  }
}
