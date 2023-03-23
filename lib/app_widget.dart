import 'package:authentication/app_splash_page.dart';
import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:authentication/src/auth/view/pages/auth_page.dart';
import 'package:authentication/src/home/controller/food_controller.dart';
import 'package:authentication/src/home/controller/home_controller.dart';
import 'package:authentication/src/home/view/pages/edit_food_page.dart';
import 'package:authentication/src/home/view/pages/foods_page.dart';
import 'package:authentication/src/home/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => FoodController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: const Color(0xfff5f5f7),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xff0071e3),
              secondary: const Color(0xffea4335)),
        ),
        initialRoute: AppSplashPage.routeName,
        routes: {
          AppSplashPage.routeName: (_) => const AppSplashPage(),
          AuthPage.routeName: (_) => const AuthPage(),
          HomePage.routeName: (_) => const HomePage(),
          FoodsPage.routeName: (_) => const FoodsPage(),
          EditFoodPage.routeName: (_) => const EditFoodPage(),
        },
      ),
    );
  }
}
