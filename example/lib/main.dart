import 'package:asyncstate/asyncstate.dart';
import 'package:example/auth/profile_page.dart';
import 'package:example/detail/detail_page.dart';
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
      /*  loader: OverlayEntry(
        builder: (context) => const GlobalLoading(),
      ), */
      onException: (exception, stackTrace, context) {
        /// Here you can handle your exceptions
        /// Leave it and it will show a simple SnackBar with the exception.toString()
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              exception.toString(),
            ),
          ),
        );
      },

      builder: (navigatorObserver) => MaterialApp(
        navigatorObservers: [navigatorObserver],
        onGenerateRoute: (settings) => MaterialPageRoute(
          settings: settings,
          builder: (context) => switch (settings.name) {
            '/Home' => const HomeLoaderPage(),
            '/Home/Detail' => const DetailPage(),
            '/Home/Detail/ProfilePage' => const ProfilePage(),
            _ => const SizedBox()
          },
        ),
        themeMode: ThemeMode.dark,
        theme: ThemeData.dark(),
        initialRoute: '/Home',
        /* routes: {
          '/Home': (context) => const HomeLoaderPage(),
          '/Home/Detail': (context) => const DetailPage(),
          '/Home/Detail/ProfilePage': (context) => const ProfilePage(),
        }, */
      ),
    );
  }
}
