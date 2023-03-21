import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:authentication/src/auth/view/components/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/login_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Selector<AuthController, FormType>(
            selector: (_, authController) => authController.formType,
            builder: (_, formType, __) {
              if (formType == FormType.login) {
                return const LoginForm();
              } else {
                return const SignupForm();
              }
            },
          ),
        ),
      ),
    );
  }
}
