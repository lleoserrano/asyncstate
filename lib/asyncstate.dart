library asyncstate;

import 'package:flutter/material.dart';
import 'class/async_class.dart';
export 'class/async_class.dart';
export 'mixin/asyncstate_mixing.dart';
export 'exceptions/async_state_exception.dart';

extension AsyncLoader<T> on Future<T> {
  //Extension on future to use in async metods
  Future<T> asyncLoader({Widget? customLoader}) async {
    try {
      return await asyncState.callAsyncLoader(
        this,
        customLoader: customLoader,
      );
    } catch (e) {
      rethrow;
    }
  }
}
