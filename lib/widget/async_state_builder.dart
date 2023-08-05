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
