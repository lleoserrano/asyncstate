import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:flutter/material.dart';

import 'components/my_loading.dart';
import 'home/home_page.dart';

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
      customLoader: const MyLoading(),

      builder: (navigatorObserver) => MaterialApp(
        themeMode: ThemeMode.dark,

        /// Here you need to pass the navigatorObserver to the MaterialApp
        navigatorObservers: [navigatorObserver],
        home: HomePage(),
      ),
    );
  }
}
