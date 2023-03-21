import 'package:authentication/src/auth/controller/auth_controller.dart';
import 'package:dio/dio.dart';
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
          onPressed: () async {
            //como utilizar o token para requisicoes
            final token = context.read<AuthController>().userToken;

            try {
              final Response res = await Dio().get(
                'http://172.30.129.176:3333/food',
                options: Options(headers: {
                  'Authorization': 'Bearer $token',
                }),
              );

              print(res.data);
            } catch (e) {
              print(e.toString());
            }
          },
          child: const Text('Press'),
        ),
      ),
    );
  }
}
