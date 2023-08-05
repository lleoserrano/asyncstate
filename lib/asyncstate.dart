library asyncstate;

import 'package:flutter/material.dart';
import 'class/async_class.dart';
import 'enum/enum_loader_type.dart';
export 'class/async_class.dart';
export 'mixin/asyncstate_mixin.dart';
export 'class/async_value.dart';
export 'enum/enum_loader_type.dart';
export 'exceptions/async_state_exception.dart';

extension AsyncLoader<T> on Future<T> {
  //Extension on future to use in async methods
  Future<T> asyncLoader({
    Widget? customLoader,
    LoaderType loaderType = LoaderType.alertDialog,
  }) async {
    assert(
      (loaderType == LoaderType.materialBanner &&
              customLoader is MaterialBanner) ||
          (loaderType == LoaderType.snackBar && customLoader is SnackBar) ||
          (loaderType == LoaderType.alertDialog),
      'If you use LoaderType.materialBanner, you need to pass a MaterialBanner widget as customLoader',
    );

    try {
      return await asyncState.callAsyncLoader(
        this,
        customLoader: customLoader,
        loaderType: loaderType,
      );
    } catch (e) {
      rethrow;
    }
  }
}
