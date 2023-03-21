import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, authController, ch) => TextField(
        controller: authController.emailController,
        onEditingComplete: () {
          FocusScope.of(context).requestFocus(authController.passwordFocus);
        },
        onChanged: (value) {
          authController.authRequest =
              authController.authRequest.copyWith(email: value);
        },
        decoration: InputDecoration(
          labelText: 'Email',
        ),
      ),
    );
  }
}
