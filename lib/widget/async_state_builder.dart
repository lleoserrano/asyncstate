import 'package:asyncstate/class/async_class.dart';
import 'package:asyncstate/observers/async_navigator_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

typedef OnException = void Function(
  Object exception,
  StackTrace stackTrace,
  BuildContext context,
);

class AsyncStateBuilder extends StatelessWidget {
  final OverlayEntry? loader;
  final Widget Function(
    AsyncNavigatorObserver navigatorObserver,
  ) builder;
  final OnException? onException;

  const AsyncStateBuilder({
    super.key,
    this.loader,
    this.onException,
    required this.builder,
  }) : super();

  @override
  Widget build(BuildContext context) {
    PlatformDispatcher.instance.onError = (error, stack) {
      if (onException != null) {
        onException!(
          error,
          stack,
          AsyncState.context,
        );
      }
      return true;
    };

    return builder(
      AsyncNavigatorObserver(),
    );
  }
}
