import 'dart:async';

import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

class AsyncLoaderHandler {
  final Completer<String> _completer;
  final Widget? customLoader;
  final LoaderType loaderType;

  AsyncLoaderHandler({
    this.customLoader,
    this.loaderType = LoaderType.alertDialog,
  }) : _completer = Completer<String>();

  void start() {
    _completer.future.asyncLoader(
      customLoader: customLoader,
      loaderType: loaderType,
    );
  }

  void close() {
    _completer.complete('AsyncLoaderHandler');
  }
}
