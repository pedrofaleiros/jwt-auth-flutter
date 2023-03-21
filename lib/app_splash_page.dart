import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:authentication/src/auth/view/pages/auth_page.dart';
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
            return HomePage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
// class AppSplashPage extends StatelessWidget {
//   const AppSplashPage({super.key});

//   static const routeName = '/';

//   Widget get _loadingIndicator => const Center(
//         child: CircularProgressIndicator(),
//       );

//   void _navigateTo(BuildContext context, String routeName) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Navigator.of(context).pushReplacementNamed(routeName);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: context.read<AuthController>().tryAutoLogin(),
//         builder: (_, snapshot) => 
//             snapshot.connectionState == ConnectionState.waiting
//             ? _loadingIndicator
//             : Selector<AuthController, bool>(
//                 selector: (_, authController) => authController.isAuthenticated,
//                 builder: (_, isAuth, __) {
//                   if (isAuth) {
//                     _navigateTo(context, HomePage.routeName);
//                   } else {
//                     _navigateTo(context, AuthPage.routeName);
//                   }

//                   return _loadingIndicator;
//                 },
//               ),
//       ),
//     );
//   }
// }
