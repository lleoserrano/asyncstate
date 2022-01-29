import 'package:flutter/material.dart';
import '../asyncstate.dart';

/// Just a mixing class to call the async loader
mixin AsyncStateMixin<T> {
  Future<T> callAsyncLoader(Future<T> futureFunction,
      {Widget? customLoader}) async {
    return await asyncState.callAsyncLoader(
      futureFunction,
      customLoader: customLoader,
    );
  }
}
