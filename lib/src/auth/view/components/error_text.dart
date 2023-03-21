import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, controller, child) => controller.errorText == null
          ? const SizedBox(
              height: 15,
            )
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                controller.errorText!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
          ),
    );
  }
}
