import 'package:flutter/material.dart';
import '../asyncstate.dart';

class AsyncNavigatorObserver extends NavigatorObserver {
  /// This class will observe the routes like push, pop and other. the class will update de context to use in the controller
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    asyncState.setContext = navigator!.context;
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    asyncState.setContext = navigator!.context;
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    asyncState.setContext = navigator!.context;
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    asyncState.setContext = navigator!.context;
  }
}
