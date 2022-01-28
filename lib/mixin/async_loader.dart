import 'package:flutter/material.dart';

import '../asyncloader.dart';

mixin AsyncLoaderMixin<T> {
  Future<T> callAsyncLoader(
      Future<T> futureFunction,{ Widget? customLoader}) async {
    return await asyncLoaderClass.callAsyncLoader(
      futureFunction,
      customLoader: customLoader,
    );
  }
}
