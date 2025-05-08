import 'package:asyncstate/src/src.dart';
import 'package:flutter/material.dart';

class AsyncNavigatorObserver extends NavigatorObserver {
  /// This class will observe the routes like push, pop and other. the class will update de context to use in the controller
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    asyncStateCore.context = navigator!.context;
    if (route.settings.name != null && route.settings.name!.isNotEmpty) {
      asyncStateCore.currentRouteName = route.settings.name!;
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    asyncStateCore.context = navigator!.context;

    if (newRoute?.settings.name != null &&
        newRoute!.settings.name!.isNotEmpty) {
      asyncStateCore.currentRouteName = newRoute.settings.name!;
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    asyncStateCore.context = navigator!.context;
    if (route.settings.name != null && route.settings.name!.isNotEmpty) {
      asyncStateCore.currentRouteName = route.settings.name!;
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    asyncStateCore.context = navigator!.context;

    if (previousRoute?.settings.name != null &&
        previousRoute!.settings.name!.isNotEmpty) {
      asyncStateCore.currentRouteName = previousRoute.settings.name!;
    }
  }
}
