import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeFormButton extends StatelessWidget {
  const ChangeFormButton({
    super.key,
    required this.formType,
  });

  final FormType formType;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (formType == FormType.login) {
          context.read<AuthController>().formType = FormType.signup;
        } else {
          context.read<AuthController>().formType = FormType.login;
        }
      },
      child: Text(
        formType == FormType.login ? 'Signup' : 'Login',
        style: TextStyle(
          color: formType == FormType.login
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
