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

  const AsyncStateBuilder({
    super.key,
    this.enableLog = true,
    this.customLoader = const DefaultLoader(),
    this.exceptionHandlers = const {},
    required this.builder,
  }) : super();

  @override
  State<AsyncStateBuilder> createState() => _AsyncStateBuilderState();
}

class _AsyncStateBuilderState extends State<AsyncStateBuilder> {
  void _checkExceptionHandlerOnCurrentRoute(
      Object exception, StackTrace stackTrace) {
    if (widget.exceptionHandlers.containsKey(asyncState.currentRouteName)) {
      widget.exceptionHandlers[asyncState.currentRouteName]?.onException(
        exception,
        stackTrace,
        asyncState.context!,
      );
    } else if (widget.exceptionHandlers.containsKey('_')) {
      widget.exceptionHandlers['_']!.onException(
        exception,
        stackTrace,
        asyncState.context!,
      );
    }
  }

  @override
  void initState() {
    asyncState = AsyncState(
      defaultDialog: widget.customLoader,
      enableLog: widget.enableLog,
    );
    PlatformDispatcher.instance.onError = (error, stack) {
      for (var handler in listOfASyncLoaderHandlers) {
        handler.close();
      }
      Future.microtask(
        () => _checkExceptionHandlerOnCurrentRoute(error, stack),
      );
      return true;
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => widget.builder(
        AsyncNavigatorObserver(),
      ),
    );
  }
}
