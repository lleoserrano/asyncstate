library asyncstate;

import 'package:flutter/material.dart';
import 'class/async_class.dart';
export 'class/async_class.dart';
export 'mixin/asyncstate_mixing.dart';

extension AsyncLoader<T> on Future<T> {
  Future<T> asyncLoader({Widget? customLoader}) async {
    try {
      return await asyncStateClass.callAsyncLoader(
        this,
        customLoader: customLoader,
      );
    } catch (e) {
      rethrow;
    }
  }
}
