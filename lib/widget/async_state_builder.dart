import 'package:asyncstate/class/private_async_helper.dart';
import 'package:asyncstate/observers/async_navigator_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef ErrorKit = ({
  Object error,
  StackTrace stackTrace,
  BuildContext context,
  String currentRoute,
});

typedef OnError = void Function(
  ErrorKit errorKit,
);

class AsyncStateBuilder extends StatelessWidget {
  final OverlayEntry? loader;
  final Widget Function(
    AsyncNavigatorObserver navigatorObserver,
  ) builder;
  final OnError? onError;

  const AsyncStateBuilder({
    super.key,
    this.loader,
    this.onError,
    required this.builder,
  }) : super();

  @override
  Widget build(BuildContext context) {
    PlatformDispatcher.instance.onError = (error, stack) {
      if (onError != null) {
        onError!(
          (
            error: error,
            stackTrace: stack,
            // ignore: invalid_use_of_protected_member
            context: PrivateAsyncHelper.context,
            currentRoute: PrivateAsyncHelper.currentRouteName
          ),
        );
      }
      return true;
    };

    return builder(
      AsyncNavigatorObserver(),
    );
  }
}
