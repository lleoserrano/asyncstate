library asyncstate;

export 'package:asyncstate/src/src.dart';

import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

AsyncLoaderHandler? extensionHandler;

extension AsyncLoader<T> on Future<T> {
  //Extension on future to use in async methods
  Future<T> asyncLoader({
    Widget? customLoader,
    LoaderType loaderType = LoaderType.alertDialog,
  }) async {
    extensionHandler = AsyncLoaderHandler.start(
      customLoader: customLoader,
      loaderType: loaderType,
    );
    final result = await this;
    extensionHandler?.close();
    return result;
  }
}

extension AsyncStateHandlerContext on BuildContext {
  void startAsyncStateLoader({
    Widget? customLoader,
    LoaderType loaderType = LoaderType.alertDialog,
  }) {
    extensionHandler = AsyncLoaderHandler.start(
      customLoader: customLoader,
      loaderType: loaderType,
    );
  }

  void closeAsyncStateLoader() {
    extensionHandler?.close();
  }
}
