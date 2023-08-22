import 'package:asyncstate/class/async_loader_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../class/async_class.dart';
import '../observers/async_navigator_observer.dart';
import 'loader/default_loader.dart';

class AsyncStateBuilder extends StatefulWidget {
  final Widget customLoader;
  final Widget Function(AsyncNavigatorObserver) builder;

  const AsyncStateBuilder({
    super.key,
    this.customLoader = const DefaultLoader(),
    required this.builder,
  }) : super();

  @override
  State<AsyncStateBuilder> createState() => _AsyncStateBuilderState();
}

class _AsyncStateBuilderState extends State<AsyncStateBuilder> {
  @override
  void initState() {
    asyncState = AsyncState(
      defaultDialog: widget.customLoader,
    );
    PlatformDispatcher.instance.onError = (error, stack) {
      for (var completer in listOfCompleters) {
        completer.complete('AsyncLoaderHandler');
      }
      listOfCompleters.clear();
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
