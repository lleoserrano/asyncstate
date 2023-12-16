import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('AsyncValue'),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('Root/HomeAsyncValue'),
              child: const Text('HomeAsyncValue'),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('AsyncState Loaders'),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/Root/HomeLoader'),
              child: const Text('HomeAsyncStateLoaders'),
            ),
          ],
        ),
      ),
    );
  }
}
