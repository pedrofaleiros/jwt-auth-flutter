import 'package:flutter/material.dart';

import '../components/login_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}
