import 'dart:async';

import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<Completer<String>> listOfCompleters = [];

class AsyncLoaderHandler {
  late final Completer<String> _completer;
  final Widget? customLoader;
  final LoaderType loaderType;

  AsyncLoaderHandler({
    this.customLoader,
    this.loaderType = LoaderType.alertDialog,
  }) {
    _completer = Completer<String>();
    listOfCompleters.add(_completer);
  }

  factory AsyncLoaderHandler.start({
    Widget? customLoader,
    LoaderType loaderType = LoaderType.alertDialog,
  }) =>
      AsyncLoaderHandler(
        customLoader: customLoader,
        loaderType: LoaderType.alertDialog,
      )..start();

  void start() {
    _completer.future.asyncLoader(
      customLoader: customLoader,
      loaderType: loaderType,
    );
  }

  void close() {
    if (!_completer.isCompleted) {
      _completer.complete('AsyncLoaderHandler');
    }
    listOfCompleters.remove(_completer);
  }
}
