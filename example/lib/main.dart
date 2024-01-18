import 'package:asyncstate/asyncstate.dart';
import 'package:example/components/global_loading.dart';
import 'package:example/detail/detail_page.dart';
import 'package:example/home_async_value/home_async_value_page.dart';
import 'package:example/login/login_page.dart';
import 'package:example/profile/profile_page.dart';
import 'package:example/root/root_page.dart';
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
      loader: GlobalLoading(),
      onError: (ErrorKit errorKit) {
        /// Here you can handle your exceptions
        /// Leave it and it will show a simple SnackBar with the exception.toString()
        ///
        switch (errorKit.currentRoute) {
          case '/Root/HomeLoader/Detail':
            showDialog(
              context: errorKit.context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(errorKit.error.toString()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Ok'),
                  )
                ],
              ),
            );
            break;
          case _:
            ScaffoldMessenger.of(errorKit.context).showSnackBar(
              SnackBar(
                content: Text(
                  errorKit.error.toString(),
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
        initialRoute: '/Root',
        routes: {
          '/Root': (context) => const RootPage(),
          '/Root/Login': (context) => LoginPage(),
          '/Root/HomeAsyncValue': (context) => const HomeAsyncValuePage(),
          '/Root/HomeLoader': (context) => const HomeLoaderPage(),
          '/Root/HomeLoader/Detail': (context) => const DetailPage(),
          '/Root/HomeLoader/ProfilePage': (context) => const ProfilePage(),
        },
      ),
    );
  }
}
