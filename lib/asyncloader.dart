library asyncloader;

import 'package:flutter/material.dart';

import 'class/async_class.dart';

export 'class/async_class.dart';

extension AsyncLoader<T> on Future<T> {
  Future<T> asyncLoader({Widget? customLoader}) async {
    try {
      return await asyncLoaderClass.callAsyncLoader(
        this,
        customLoader: customLoader,
      );
    } catch (e) {
      rethrow;
    }
  }
}
