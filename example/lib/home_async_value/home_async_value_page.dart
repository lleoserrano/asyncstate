import 'package:example/home_async_value/model/user_model.dart';
import 'package:example/home_async_value/user_session.dart';
import 'package:flutter/material.dart';

import 'home_async_value_controller.dart';

class HomeAsyncValuePage extends StatelessWidget {
  const HomeAsyncValuePage({super.key});

  @override
  Widget build(BuildContext context) {
    final myUserAsyncClass = CurrentSession(null);
    final HomeAsyncValueController(:me, :loadMe, :updateInternal) =
        HomeAsyncValueController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('AsyncValue'),
      ),
      body: Center(
        child: ListView(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'AsyncValue by controller',
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                    me.build(
                      onLoading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      onError: (e, s) => Center(
                        child: Text(e.toString()),
                      ),
                      onSuccess: (me) => switch (me) {
                        User(:final name) => Center(
                            child: Text(name),
                          ),
                        null => const Center(
                            child: Text('No user'),
                          ),
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: 150,
                      child: FloatingActionButton(
                        onPressed: () => updateInternal(),
                        child: const Text('Change Name'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 150,
                      child: FloatingActionButton(
                        onPressed: () => loadMe(),
                        child: const Text('Get User'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Class extending AsyncValue',
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Widget unique for AppBar',
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    myUserAsyncClass.buildForAppBar(),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Widget unique for Body',
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    myUserAsyncClass.buildForBody(),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: 150,
                      child: FloatingActionButton(
                        onPressed: () async => myUserAsyncClass.login(),
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 150,
                      child: FloatingActionButton(
                        onPressed: () => myUserAsyncClass.logout(),
                        child: const Text('Logout'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
