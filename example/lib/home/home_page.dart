import 'package:asyncstate/asyncstate.dart';
import 'package:example/home/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await controller.loginPersonalizedLoader();
            },
            child: const Text('Login Success Personalized'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              await controller.loginSuccess();
            },
            child: const Text('Login Success'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              await controller.loginSuccessHandler();
            },
            child: const Text('Login Success Handler'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              await controller.loginFailure();
            },
            child: const Text('Login Error'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              await controller.loginFailureHandler();
            },
            child: const Text('Login Error Handler'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              await controller.loadMorePersonalized();
            },
            child: const Text('Load More Personalized'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              context.showLoader();
              await Future.delayed(const Duration(seconds: 2));
              context.closeLoader();
            },
            child: const Text('Loader by context'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              context.showLoader();
              await errorCall();
              context.closeLoader();
            },
            child: const Text('Loader Error by context'),
          ),
          const Divider(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey[900],
            ),
            onPressed: () async {
              Navigator.of(context).pushNamed('/Home/Detail');
            },
            child: const Text('Detail Page'),
          ),
        ],
      ),
    );
  }

  Future<void> errorCall() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Error');
  }
}
