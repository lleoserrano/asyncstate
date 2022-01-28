import 'package:flutter/material.dart';

import 'home_controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const FlutterLogo(),
          const SizedBox(
            height: 16,
          ),
          const Text(
              'No botão abaixo a um loading de 3s e depois volta para pagina anterior.'),
          const SizedBox(
            height: 16,
          ),
          const Text(
              'É para que possa ver, que Navegação por gesto e botão "back" nativo não fecham o loading.'),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              await controller.callAsyncLoader(
                controller.goBack(
                  () => Navigator.pop(context),
                ),
              );
            },
            child: const Text('Voltar com async.'),
          ),
        ],
      ),
    );
  }
}
