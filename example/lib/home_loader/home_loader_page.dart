import 'package:asyncstate/asyncstate.dart';
import 'package:example/components/global_custom_loading.dart';
import 'package:flutter/material.dart';

class HomeLoaderPage extends StatelessWidget {
  const HomeLoaderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Loader')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 2)).asyncLoader(
                loader: const GlobalCustomLoading(),
              );
            },
            child: const Text('Async Loader Personalized'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              debugPrint(
                await Future.delayed(const Duration(seconds: 5), () {
                  return 'Async Loader Success';
                }).asyncLoader(),
              );
            },
            child: const Text('Async Loader Success'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              final first =
                  await Future.delayed(const Duration(seconds: 2), () {
                return 'Async Loader Lazy';
              }).asyncLazyLoader();

              debugPrint(first);

              final second =
                  await Future.delayed(const Duration(seconds: 2), () {
                return 'Async Loader Lazy - Second operation';
              });

              debugPrint(second);

              await AsyncLoader.hide();
            },
            child: const Text('Async Loader Lazy'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              final first =
                  await Future.delayed(const Duration(seconds: 2), () {
                return 'Async Loader Lazy';
              }).asyncLazyLoader();

              debugPrint(first);

              final second =
                  await Future.delayed(const Duration(seconds: 2), () {
                return 'Async Loader Lazy - Second operation';
              }).asyncLoader(
                loader: const GlobalCustomLoading(),
              );

              debugPrint(second);
            },
            child: const Text('Async Loader Lazy - Changing Loader'),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 2), () {
                throw Exception('Async Loader Error');
              }).asyncLoader();
            },
            child: const Text('Async Loader Error'),
          ),
          const Divider(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey[900],
            ),
            onPressed: () async {
              await Navigator.of(context).pushNamed('/Detail').asyncAwaitLoader(
                    loader: const GlobalCustomLoading(),
                  );

              debugPrint('Detail Page Closed - Do something here');
              await Future.delayed(const Duration(seconds: 2));
              await AsyncLoader.hide();
            },
            child: const Text('Detail Page'),
          ),
          const Divider(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey[900],
            ),
            onPressed: () async {
              Navigator.of(context).pushNamed('/Profile');
            },
            child: const Text('Go to Profile Page'),
          ),
        ],
      ),
    );
  }
}
