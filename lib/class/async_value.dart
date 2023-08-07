/* import 'dart:async';

import 'package:flutter/material.dart';

enum AsyncValueState { loading, error, success }

extension Helper<T> on T {
  AsyncValue<T> asyncValue() => AsyncValue<T>(this);
}

extension AsyncValueStateExtension<T> on AsyncValue<T> {
  void setLoading() => state.add(AsyncValueState.loading);
  void setError(String errorMessage) {
    _errorMessage = errorMessage;
    state.add(AsyncValueState.error);
  }

  void setSuccess(T newValue) {
    value = newValue;
    state.add(AsyncValueState.success);
  }
}

class AsyncValue<T> {
  T value;
  String? _errorMessage;
  final StreamController<AsyncValueState> state;

  AsyncValue(
    T initialValue,
  )   : state = StreamController<AsyncValueState>.broadcast(),
        value = initialValue;

  void dispose() {
    state.close();
  }

  Widget build({
    required Widget Function() loading,
    required Widget Function(String? e) error,
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
            return error.call(_errorMessage);
          case AsyncValueState.success:
            return success.call(value);
        }
      },
    );
  }
}
 */