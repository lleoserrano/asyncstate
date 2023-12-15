import 'dart:async';

import 'package:flutter/material.dart';

enum AsyncValueState { loading, error, success }

extension AsyncValueHelper<T> on T {
  AsyncValue<T> asyncValue() => AsyncValue<T>(this);
}

class AsyncValue<T> {
  T value;
  Exception? _exception;
  final StreamController<AsyncValueState> state;

  AsyncValue(
    T initialValue,
  )   : state = StreamController<AsyncValueState>.broadcast(),
        value = initialValue;

  void dispose() {
    state.close();
  }

  void setLoading() => state.add(AsyncValueState.loading);
  void setError(Exception? exception) {
    _exception = exception;
    state.add(AsyncValueState.error);
  }

  void setSuccess(T value) {
    this.value = value;
    state.add(AsyncValueState.success);
  }

  Widget build({
    required Widget Function() loading,
    required Widget Function(Exception exception, StackTrace stackTrace) error,
    required Widget Function(T value) success,
  }) {
    return StreamBuilder<AsyncValueState>(
      stream: state.stream,
      initialData: AsyncValueState.loading,
      builder: (context, snapshot) {
        switch (snapshot.data!) {
          case AsyncValueState.loading:
            return loading();
          case AsyncValueState.error:
            return error.call(_exception ?? Exception(), StackTrace.current);
          case AsyncValueState.success:
            return success.call(value);
        }
      },
    );
  }
}
