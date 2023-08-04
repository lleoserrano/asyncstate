import 'package:asyncstate/asyncstate.dart';
import 'package:example/components/my_loadig.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  AsyncState.setLoaderPersonalized(
    defaultLoaderWidget: const MyLoading(),

    /// Here you can customize your default loading that will show every transaction
    /// Leave it and it will show a simple CircularProgress indicator
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      navigatorObservers: [AsyncState.observer],

      /// Add Observer navigatowr para pegar o contexto.
      // theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
