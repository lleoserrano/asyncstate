import 'package:flutter/material.dart';

import '../asyncstate.dart';

mixin AsyncStateMixin<T> {
  Future<T> callAsyncLoader(Future<T> futureFunction,
      {Widget? customLoader}) async {
    return await asyncState.callAsyncLoader(
      futureFunction,
      customLoader: customLoader,
    );
  }
}
