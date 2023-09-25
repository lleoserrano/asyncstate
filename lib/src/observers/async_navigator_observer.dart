import 'package:flutter/material.dart';
import 'package:asyncstate/src/src.dart';

class AsyncNavigatorObserver extends NavigatorObserver {
  /// This class will observe the routes like push, pop and other. the class will update de context to use in the controller
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    asyncState.setContext = navigator!.context;
    if (route.settings.name != null && route.settings.name!.isNotEmpty) {
      asyncState.currentRouteName = route.settings.name!;
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    asyncState.setContext = navigator!.context;

    if (newRoute?.settings.name != null &&
        newRoute!.settings.name!.isNotEmpty) {
      asyncState.currentRouteName = newRoute.settings.name!;
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    asyncState.setContext = navigator!.context;
    if (route.settings.name != null && route.settings.name!.isNotEmpty) {
      asyncState.currentRouteName = route.settings.name!;
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    asyncState.setContext = navigator!.context;

    if (previousRoute?.settings.name != null &&
        previousRoute!.settings.name!.isNotEmpty) {
      asyncState.currentRouteName = previousRoute.settings.name!;
    }
  }
}
