import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.formType,
  });

  final FormType formType;

  Widget get _loadingIndicator => SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          color: Colors.grey.withOpacity(0.5),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, controller, ch) => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            formType == FormType.login
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
          ),
          padding: MaterialStateProperty.all(
            controller.isLoading
                ? const EdgeInsets.symmetric(
                    horizontal: 55,
                    vertical: 8,
                  )
                : const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        onPressed: controller.isLoading
            ? null
            : () async {
                if (formType == FormType.login) {
                  await controller.login();
                } else {
                  await controller.signup();
                }
              },
        child: controller.isLoading
            ? _loadingIndicator
            : Text(
                formType == FormType.login ? 'Login' : 'Signup',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
