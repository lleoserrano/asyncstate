library asyncstate;

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

enum AsyncValueState { loading, error, success }

final AsyncValue<Widget> _asyncWidgetLoader = _customLoader.asyncValue()
  ..setLoading();
Widget _customLoader = const Center(
  child: CircularProgressIndicator.adaptive(),
);
BuildContext? _buildContext;
RouteSettings? _currentRoute;
const _asyncLoaderRoute = '/AsyncLoader';
final _isAsyncLoaderActive = ValueNotifier(false);

extension AsyncLoaderExtension<T> on Future<T> {
  /// This method will show a loader while the future is being processed and will close the loader when the future is completed
  Future<T> asyncLoader({
    Widget? loader,
  }) async {
    try {
      await AsyncLoader.show(loader: loader);
      final result = await this;

      await AsyncLoader.hide();

      return result;
    } catch (e) {
      await AsyncLoader.hide();
      rethrow;
    }
  }

  /// This method will show a loader while the future is being processed but will not close the loader when the future is completed
  Future<T> asyncLazyLoader({
    Widget? loader,
  }) async {
    try {
      await AsyncLoader.show(loader: loader);
      final result = await this;

      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<T> asyncAwaitLoader({
    Widget? loader,
  }) async {
    try {
      final result = await this;
      await AsyncLoader.show(loader: loader);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}

@protected
final class AsyncLoader {
  static Future<void> show({
    Widget? loader,
  }) async {
    if (_buildContext != null) {
      _asyncWidgetLoader.value = loader ?? _customLoader;
      if (!_isAsyncLoaderActive.value) {
        _isAsyncLoaderActive.value = true;
        showDialog(
          context: _buildContext!,
          routeSettings: const RouteSettings(name: _asyncLoaderRoute),
          barrierColor: Colors.transparent,
          barrierDismissible: false,
          useRootNavigator: true,
          builder: (context) {
            return PopScope(
              canPop: false,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: _asyncWidgetLoader.build(
                  onSuccess: (widget) => widget,
                  onLoading: () => _asyncWidgetLoader.value,
                  onError: (e, s) => _asyncWidgetLoader.value,
                ),
              ),
            );
          },
        ).then(
          (value) => _isAsyncLoaderActive.value = false,
        );
      }
      return await Future.delayed(Duration.zero);
    } else {
      throw Exception(
        'No context, you need to wrap your MaterialApp with AsyncStateBuilder',
      );
    }
  }

  static Future<void> hide() async {
    if (_buildContext != null) {
      switch (_isAsyncLoaderActive.value) {
        case false:
          null;
        case true:
          Navigator.of(_buildContext!).pop();
      }
      return await Future.delayed(Duration.zero);
    } else {
      throw Exception(
        'No context, you need to wrap your MaterialApp with AsyncStateBuilder',
      );
    }
  }
}

@protected
final class AsyncNavigatorObserver extends NavigatorObserver {
  /// This class will observe the routes like push, pop and other. The class will update de context to use in the controller
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _buildContext = navigator?.context;
    _currentRoute = route.settings;
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _buildContext = navigator?.context;
    _currentRoute = newRoute?.settings;
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _buildContext = navigator?.context;
    _currentRoute = route.settings;
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    _buildContext = navigator?.context;
    _currentRoute = previousRoute?.settings;
  }
}

@protected
final class AsyncStateBuilder extends StatelessWidget {
  final Widget? loader;
  final Widget Function(
    AsyncNavigatorObserver navigatorObserver,
  ) builder;
  final void Function(
    Object error,
    StackTrace stackTrace,
    BuildContext? context,
    RouteSettings? routeSettings,
  )? onError;

  const AsyncStateBuilder({
    super.key,
    this.loader,
    this.onError,
    required this.builder,
  }) : super();

  @override
  Widget build(BuildContext context) {
    if (loader != null) {
      _asyncWidgetLoader.value = loader!;
      _customLoader = loader!;
    }
    PlatformDispatcher.instance.onError = (error, stack) {
      onError?.call(
        error,
        stack,
        _buildContext,
        _currentRoute,
      );
      return true;
    };
    return builder(
      AsyncNavigatorObserver(),
    );
  }
}

extension AsyncValueHelper<T> on T {
  AsyncValue<T> asyncValue() => AsyncValue<T>(this);
  // ignore: avoid_shadowing_type_parameters
  AsyncValue<T?> asyncValueN<T>() => AsyncValue<T?>(null);
}

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
  void setSuccess(T valueSuccess) => {
        value = valueSuccess,
        _state = AsyncValueState.success,
        notifyListeners()
      };
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
