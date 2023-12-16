import 'package:flutter/material.dart';

enum AsyncValueState { loading, error, success }

extension AsyncValueHelper<T> on T {
  AsyncValue<T> asyncValue() => AsyncValue<T>(this);
  // ignore: avoid_shadowing_type_parameters
  AsyncValue<T?> asyncValueN<T>() => AsyncValue<T?>(null);
}

/* 
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
 */
class AsyncValue<T> extends ValueNotifier<T> {
  AsyncValueState _state;
  Object? _error;
  StackTrace? _stackTrace;
  AsyncValue(super.value) : _state = AsyncValueState.success;

  AsyncValueState get state => _state;
  Object? get error => _error;
  StackTrace? get stackTrace => _stackTrace;
  bool get isLoading => _state == AsyncValueState.loading;
  bool get hasError => _state == AsyncValueState.error;

  void setLoading() => {_state = AsyncValueState.loading, notifyListeners()};
  void setError({Object? error, StackTrace? stackTrace}) => {
        _state = AsyncValueState.error,
        notifyListeners(),
        _error = error,
        _stackTrace = stackTrace,
      };
  void setSuccess() => {_state = AsyncValueState.success, notifyListeners()};
  void refresh() => notifyListeners();

  ValueListenableBuilder<T> build({
    required Widget Function(T value) onSuccess,
    required Widget Function() onLoading,
    required Widget Function(Object e, StackTrace s) onError,
  }) {
    return ValueListenableBuilder(
      valueListenable: this,
      builder: (context, value, child) => switch (_state) {
        AsyncValueState.loading => onLoading(),
        AsyncValueState.error => onError(
            error ?? Exception(),
            _stackTrace ?? StackTrace.current,
          ),
        AsyncValueState.success => onSuccess(value),
      },
    );
  }
}
