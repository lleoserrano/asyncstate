library asyncstate;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final AsyncStateNotifier<Widget> _asyncWidgetLoader = _customLoader.obs
  ..setLoading();
Widget _customLoader = Center(
  child: Container(
    decoration: BoxDecoration(
      color: Theme.of(_buildContext!).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.all(16),
    child: const CircularProgressIndicator.adaptive(),
  ),
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

  /// This method will show a loader after the future get proceed but will not close the loader
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
    Color? barrierColor,
  }) async {
    if (_buildContext != null) {
      _asyncWidgetLoader.value = loader ?? _customLoader;
      if (!_isAsyncLoaderActive.value) {
        _isAsyncLoaderActive.value = true;
        showDialog(
          context: _buildContext!,
          routeSettings: const RouteSettings(name: _asyncLoaderRoute),
          barrierColor: barrierColor,
          barrierDismissible: false,
          useRootNavigator: true,
          useSafeArea: false,
          builder: (context) {
            return PopScope(
              canPop: false,
              child: Material(
                color: Colors.transparent,
                child: _asyncWidgetLoader.build(
                  onSuccess: (widget) => widget!,
                  onLoading: () => _asyncWidgetLoader.value!,
                  onError: (e, s) => _asyncWidgetLoader.value!,
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

abstract class AsyncValueState {}

final class AsyncStateSuccess extends AsyncValueState {}

final class AsyncStateEmpty extends AsyncValueState {}

final class AsyncStateError extends AsyncValueState {
  final Object error;
  final StackTrace? stackTrace;
  AsyncStateError(this.error, this.stackTrace);
  ({Object e, StackTrace? s}) get resume => (e: error, s: stackTrace);
}

final class AsyncStateLoading extends AsyncValueState {}

extension AsyncValueHelper<T extends Object?> on T {
  AsyncStateNotifier<T> get obs => AsyncStateNotifier<T>(this);
  AsyncStateNotifier<M?> obsNullable<M>() => AsyncStateNotifier<M>(null);
}

class AsyncStateNotifier<T extends Object?> extends ValueNotifier<T?> {
  final ValueNotifier<AsyncValueState> _state;
  AsyncStateNotifier(super.value, {AsyncValueState? status})
      : _state = ValueNotifier(status ?? AsyncStateSuccess());

  //State
  AsyncValueState get state => _state.value;
  set state(AsyncValueState s) => _state.value = s;

  //get
  ValueNotifier<AsyncValueState> get stateNotifier => _state;
  bool get isLoading => _state is AsyncStateLoading;
  bool get hasError => _state is AsyncStateError;
  ({Object e, StackTrace? s}) get error => (state as AsyncStateError).resume;
  bool isStatus<M>() => _state.value is M;

  //set
  void setLoading() => _state.value = AsyncStateLoading();
  void setSuccess({T? value}) => {
        if (value != null) this.value = value,
        _state.value = AsyncStateSuccess(),
      };
  void setEmpty() => _state.value = AsyncStateEmpty();
  void setError(Object e, {StackTrace? s}) =>
      _state.value = AsyncStateError(e, s);

  void addStateListener(void Function() listener) =>
      _state.addListener(listener);
  void removeStateListener(void Function() listener) =>
      _state.removeListener(listener);

  Widget build({
    Widget Function(T? value)? onSuccess,
    Widget Function(T? value)? onEmpty,
    Widget Function()? onLoading,
    Widget Function(Object e, StackTrace? s)? onError,
    Widget Function(T? value, AsyncValueState state)? onState,
  }) {
    return ValueListenableBuilder(
      valueListenable: _state,
      builder: (context, state, child) => switch (state) {
        AsyncStateLoading() => switch (onLoading) {
            null => const Placeholder(),
            _ => onLoading(),
          },
        AsyncStateError(:final error, :final stackTrace) => switch (onError) {
            null => const Placeholder(),
            _ => onError(error, stackTrace),
          },
        AsyncStateSuccess() => switch (onSuccess) {
            null => const Placeholder(),
            _ => onSuccess(value),
          },
        AsyncStateEmpty() => switch (onEmpty) {
            null => const Placeholder(),
            _ => onEmpty(value),
          },
        _ => switch (onState) {
            null => const Placeholder(),
            _ => onState(value, _state.value),
          },
      },
    );
  }

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }
}
