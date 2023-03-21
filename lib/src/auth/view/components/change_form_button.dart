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
    return Row(
      mainAxisAlignment: formType == FormType.login
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            if (formType == FormType.login) {
              context.read<AuthController>().formType = FormType.signup;
            } else {
              context.read<AuthController>().formType = FormType.login;
            }
          },
          child: formType == FormType.login
              ? Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Signup'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                )
              : Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.arrow_back_ios),
                    Text('Login'),
                  ],
                ),
        ),
      ],
    );
  }
}
/* 
return TextButton(
      onPressed: () {
        if (formType == FormType.login) {
          context.read<AuthController>().formType = FormType.signup;
        } else {
          context.read<AuthController>().formType = FormType.login;
        }
      },
      child: formType == FormType.login
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text('Signup'),
                Icon(Icons.arrow_forward_ios),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.arrow_back_ios),
                Text('Login'),
              ],
            ),
    );
 */