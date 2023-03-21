import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async => context.read<AuthController>().logout(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            //como utilizar o token para requisicoes
            final token = context.read<AuthController>().userToken;
            print(token ?? 'sem token');
          },
          child: const Text('Press'),
        ),
      ),
    );
  }
}
