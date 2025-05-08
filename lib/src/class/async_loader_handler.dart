/* import 'dart:async';

import 'package:asyncstate/src/src.dart';
import 'package:flutter/material.dart';

var listOfASyncLoaderHandlers = <AsyncLoaderHandler>[];

class AsyncLoaderHandler {
  late final Completer<String> _completer;
  final Widget? customLoader;
  final LoaderType loaderType;

  AsyncLoaderHandler({
    this.customLoader,
    this.loaderType = LoaderType.alertDialog,
  }) {
    _completer = Completer<String>();
    listOfASyncLoaderHandlers.add(this);
  }

  factory AsyncLoaderHandler.start({
    Widget? customLoader,
    LoaderType loaderType = LoaderType.alertDialog,
  }) =>
      AsyncLoaderHandler(
        customLoader: customLoader,
        loaderType: loaderType,
      )..start();

  void start() {
    listOfASyncLoaderHandlers.removeWhere(
      (element) => element._completer.isCompleted,
    );
    asyncState.callAsyncLoader(
      _completer.future,
      customLoader: customLoader,
      loaderType: loaderType,
    );
  }

  void close() {
    if (!_completer.isCompleted) {
      _completer.complete('AsyncLoaderHandler');
    }
  }
}
 */
