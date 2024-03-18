import 'package:asyncstate/asyncstate.dart';
import 'package:example/components/global_loading.dart';
import 'package:example/detail/detail_page.dart';
import 'package:example/detail/detail_page_handler_exception.dart';
import 'package:example/profile/profile_page.dart';
import 'package:flutter/material.dart';

import 'home_loader/home_loader_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Here you need to wrap your MaterialApp with the AsyncStateBuilder
    return AsyncStateBuilder(
      /// Here you can customize your default loading that will show every transaction
      /// Leave it and it will show a simple CircularProgress.adaptive indicator
      loader: const GlobalLoading(),
      onError: (error, stackTrace, context, routeSettings) {
        /// Here you can handle your exceptions
        switch (routeSettings?.name ?? '') {
          case '/Detail':
            DetailPageHandlerException.onError(
              error,
              stackTrace,
              context,
              routeSettings,
            );
            break;
          case _:
            ScaffoldMessenger.of(context!).showSnackBar(
              SnackBar(
                content: Text(
                  error.toString(),
                ),
              ),
            );
            break;
        }
      },
      builder: (navigatorObserver) => MaterialApp(
        navigatorObservers: [navigatorObserver],
        themeMode: ThemeMode.dark,
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeLoaderPage(),
          '/Detail': (context) => const DetailPage(),
          '/Profile': (context) => const ProfilePage()
        },
      ),
    );
  }
}
