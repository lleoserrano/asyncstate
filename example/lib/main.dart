import 'package:asyncstate/asyncstate.dart';
import 'package:example/components/global_loading.dart';
import 'package:example/detail/detail_exception_handler.dart';
import 'package:example/detail/detail_page.dart';
import 'package:example/exceptions/global_exception_handler.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Here you need to wrap your MaterialApp with the AsyncStateBuilder
    return AsyncStateBuilder(
      /// Here you can customize your default loading that will show every transaction
      /// Leave it and it will show a simple CircularProgress.adaptive indicator
      customLoader: const GlobalLoading(),

      /// Here you can enable or disable the log
      enableLog: true,

      ///You can customize your exceptions handlers for route
      exceptionHandler: {
        '_': GlobalExceptionHandler(),
        '/Home/Detail': DetailExceptionHandler(),
      },
      builder:
          (navigatorObserver) => MaterialApp(
            themeMode: ThemeMode.dark,
            theme: ThemeData.dark(),

            /// Here you need to pass the navigatorObserver to the MaterialApp
            navigatorObservers: [navigatorObserver],
            initialRoute: '/Home',
            routes: {
              '/Home': (context) => const HomePage(),
              '/Home/Detail': (context) => const DetailPage(),
              '/Home/Detail/SecondDetail':
                  (context) => const SecondDetailPage(),
            },
          ),
    );
  }
}
