library;

import 'dart:async';

import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

export 'package:asyncstate/src/src.dart';

extension AsyncLoader<T> on Future<T> {
  /// This extension will help you to use the async loader in your app.
  Future<void> asyncLoader({
    Widget? loader,
    bool autoClose = true,
    Future<void> Function(T result)? success,
    Future<void> Function(Object error)? error,
    Future<void> Function()? complete,
  }) async {
    try {
      await AsyncState.showLoader(
        customLoader: loader,
      );
      final result = await this;
      if (autoClose) {
        AsyncState.closeLoader();
      }
      if (success != null) {
        return await success(result);
      }
    } catch (e) {
      if (autoClose) {
        AsyncState.closeLoader();
      }
      await error?.call(e);
    } finally {
      await complete?.call();
    }
  }
}

extension AsyncStateHandlerContext on BuildContext {
  Future<void> showLoader({
    Widget? loader,
  }) async {
    await AsyncState.showLoader(
      customLoader: loader,
    );
  }

  void closeLoader() {
    AsyncState.closeLoader();
  }
}
