import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:authentication/src/auth/view/components/action_button.dart';
import 'package:authentication/src/auth/view/components/change_form_button.dart';
import 'package:flutter/material.dart';

import 'email_input.dart';
import 'error_text.dart';
import 'password_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: Colors.white,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            EmailInput(),
            SizedBox(height: 10),
            PasswordInput(),
            SizedBox(height: 10),
            ErrorText(),
            ButtonsRow(),
          ],
        ),
      ),
    );
  }
}

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Container()),
        const Expanded(
          flex: 1,
          child: ActionButton(formType: FormType.login),
        ),
        const Expanded(
          flex: 1,
          child: ChangeFormButton(formType: FormType.login),
        ),
      ],
    );
  }
}
