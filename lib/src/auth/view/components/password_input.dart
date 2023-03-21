import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  void _changeVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget get _sufficIcon => _obscureText
      ? IconButton(
          onPressed: _changeVisibility,
          icon: const Icon(Icons.visibility_off),
        )
      : IconButton(
          onPressed: _changeVisibility,
          icon: const Icon(Icons.visibility),
        );

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, authController, ch) => TextField(
        focusNode: authController.passwordFocus,
        obscureText: _obscureText,
        controller: authController.passwordController,
        onEditingComplete: () async => authController.login(),
        onChanged: (value) {
          authController.authRequest =
              authController.authRequest.copyWith(password: value);
        },
        decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: _sufficIcon,
        ),
      ),
    );
  }
}
