import 'package:asyncloader/asyncloader.dart';
import 'package:example/components/my_loadig.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  AsyncLoaderClass.onInitAsyncLoaderState(
    defaultDialogWidget:
        const MyLoading(), //TODO Seta o Widget de loading inicial.
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
      navigatorObservers: [
        AsyncLoaderClass.observer
      ], //TODO Add Observer navigator para pegar o contexto.
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
