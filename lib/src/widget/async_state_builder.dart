import 'package:asyncstate/src/src.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AsyncStateBuilder extends StatefulWidget {
  final Widget customLoader;
  final Widget Function(AsyncNavigatorObserver) builder;
  final Map<String, AsyncStateExceptionHandler> exceptionHandler;
  final bool enableLog;

  const AsyncStateBuilder({
    super.key,
    this.enableLog = true,
    this.customLoader = const GenericLoaderWidget(),
    this.exceptionHandler = const {},
    required this.builder,
  });

  @override
  State<AsyncStateBuilder> createState() => _AsyncStateBuilderState();
}

class _AsyncStateBuilderState extends State<AsyncStateBuilder> {
  void _checkExceptionHandlerOnCurrentRoute(
      Object exception, StackTrace stackTrace) {
    if (widget.exceptionHandler.containsKey(asyncStateCore.currentRouteName)) {
      widget.exceptionHandler[asyncStateCore.currentRouteName]?.onException(
        exception,
        stackTrace,
        asyncStateCore.context!,
      );
    } else if (widget.exceptionHandler.containsKey('_')) {
      widget.exceptionHandler['_']!.onException(
        exception,
        stackTrace,
        asyncStateCore.context!,
      );
    }
  }

  @override
  void initState() {
    asyncStateCore = AsyncStateCore(
      defaultDialog: widget.customLoader,
      enableLog: widget.enableLog,
    );
    PlatformDispatcher.instance.onError = (error, stack) {
      AsyncState.closeLoader();
      Future.microtask(
        () => _checkExceptionHandlerOnCurrentRoute(error, stack),
      );
      return true;
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      asyncStateCore.observer,
    );
  }
}
