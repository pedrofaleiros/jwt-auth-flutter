import 'package:authentication/app_splash_page.dart';
import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:authentication/src/auth/view/pages/auth_page.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: const Color(0xfff5f5f7),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xff0071e3),
          ),
        ),
        initialRoute: AppSplashPage.routeName,
        routes: {
          AppSplashPage.routeName: (_) => AppSplashPage(),
          AuthPage.routeName: (_) => AuthPage(),
          HomePage.routeName: (_) => HomePage(),
        },
      ),
    );
  }
}
