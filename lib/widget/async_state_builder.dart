<<<<<<< Updated upstream:lib/widget/async_state_builder.dart
import 'package:asyncstate/class/async_loader_handler.dart';
import 'package:asyncstate/class/async_state_exception_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../class/async_class.dart';
import '../observers/async_navigator_observer.dart';
import 'loader/default_loader.dart';

class AsyncStateBuilder extends StatefulWidget {
  final Widget customLoader;
  final Widget Function(AsyncNavigatorObserver) builder;
  final Map<String, AsyncStateExceptionHandler> exceptionHandlers;
  final bool enableLog;
=======
import 'package:asyncstate/src/src.dart';
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
>>>>>>> Stashed changes:lib/src/widget/async_state_builder.dart

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
