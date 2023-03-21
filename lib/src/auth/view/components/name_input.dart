import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, authController, __) => TextField(
        controller: authController.nameController,
        onEditingComplete: () {
          FocusScope.of(context).requestFocus(authController.emailFocus);
        },
        onChanged: (value) {
          // authController.authRequest =
          //     authController.authRequest.copyWith(email: value);
        },
        decoration: InputDecoration(
          labelText: 'Name',
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          //
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.5,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
