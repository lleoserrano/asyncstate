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
              'You can press the button above go back using the async loading.'),
          const SizedBox(
            height: 16,
          ),
          const Text("You can't go back with android back button from here! "),
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
            child: const Text('Back with async!'),
          ),
        ],
      ),
    );
  }
}
