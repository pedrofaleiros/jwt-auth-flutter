import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:authentication/src/auth/view/pages/auth_page.dart';
import 'package:authentication/src/home/controller/home_controller.dart';
import 'package:authentication/src/home/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSplashPage extends StatelessWidget {
  const AppSplashPage({super.key});

  static const routeName = '/';

  Widget get _loadingIndicator => const Center(
        child: CircularProgressIndicator(),
      );

  @override
  Widget build(BuildContext context) {
    return Selector<AuthController, bool>(
      selector: (_, auth) => auth.isAuthenticated,
      builder: (_, isAuthenticated, __) => FutureBuilder(
        future: context.read<AuthController>().tryAutoLogin(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _loadingIndicator;
          }

          if (isAuthenticated) {
            final user = context.read<AuthController>().user;

            if (user != null) {
              final homeController = context.read<HomeController>();
              homeController.user = user;
              homeController.loadMeals().then((value) {
                return;
              }).catchError(() {});
              return HomePage();
            }

            return AuthPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
