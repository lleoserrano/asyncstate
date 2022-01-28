import 'package:example/home/home_controller.dart';
import 'package:example/home/second_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                if (await controller.loginSucesso()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(
                              controller: controller,
                            )),
                  );
                }
              },
              child: const Text('Login Sucesso'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await controller.loginError();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Erro!'),
                        Text(e.toString()),
                      ],
                    ),
                  ),
                );
              }
            },
            child: const Text('Login Falha'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (await controller.isValidUser()) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Sucesso'),
                    Text('É um user valido.'),
                  ],
                )));
              }
            },
            child: const Text('User Valido ?'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (await controller.isValidUserAndLogin()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondPage(
                            controller: controller,
                          )),
                );
              }
            },
            child: const Text('User Valido ? + Login Sucesso'),
          ),
        ],
      ),
    );
  }
}
