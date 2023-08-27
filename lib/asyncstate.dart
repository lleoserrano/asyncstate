library asyncstate;

import 'package:asyncstate/class/async_loader_handler.dart';
import 'package:flutter/material.dart';
import 'enum/enum_loader_type.dart';
export 'class/async_class.dart';
export 'mixin/asyncstate_mixin.dart';
export 'class/async_value.dart';
export 'enum/enum_loader_type.dart';
export 'exceptions/async_state_exception.dart';
export 'class/async_loader_handler.dart';

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
