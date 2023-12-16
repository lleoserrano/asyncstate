import 'package:example/home_loader/home_loader_controller.dart';
import 'package:flutter/material.dart';

class HomeLoaderPage extends StatelessWidget {
  const HomeLoaderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await HomeLoaderController.loginPersonalizedLoader();
            },
            child: const Text('Login Success Personalized'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              await HomeLoaderController.loginSuccess();
            },
            child: const Text('Login Success'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              await HomeLoaderController.loginSuccessHandler();
            },
            child: const Text('Login Success Handler'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              await HomeLoaderController.loginFailure();
            },
            child: const Text('Login Error'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              await HomeLoaderController.loginFailureHandler();
            },
            child: const Text('Login Error Handler'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              await HomeLoaderController.loadMorePersonalized();
            },
            child: const Text('Load More Personalized'),
          ),
          const Divider(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey[900],
            ),
            onPressed: () async {
              Navigator.of(context).pushNamed('/Root/HomeLoader/Detail');
            },
            child: const Text('Detail Page'),
          ),
          const Divider(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey[900],
            ),
            onPressed: () async {
              Navigator.of(context).pushNamed('/Root/HomeLoader/ProfilePage');
            },
            child: const Text('Go to Profile Page'),
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
