import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

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
          padding: MaterialStateProperty.all(
            controller.isLoading
                ? const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  )
                : const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        onPressed:
            controller.isLoading ? null : () async => await controller.login(),
        child: controller.isLoading
            ? _loadingIndicator
            : const Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
