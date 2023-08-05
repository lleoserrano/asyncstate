import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:example/components/my_loadig.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return MaterialApp(
      themeMode: ThemeMode.dark,
      navigatorObservers: [AsyncState.observer],

      /// Add Observer navigatowr para pegar o contexto.
      theme: ThemeData.dark(),
      home: HomePage(),
=======
    return AsyncStateBuilder(
      customLoader: const MyLoading(),
      builder: (navigatorObserver) => MaterialApp(
        themeMode: ThemeMode.dark,
        navigatorObservers: [navigatorObserver],
        home: HomePage(),
      ),
>>>>>>> Stashed changes
    );
  }
}
