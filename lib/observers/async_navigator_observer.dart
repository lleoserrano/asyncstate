<<<<<<< Updated upstream:lib/observers/async_navigator_observer.dart
import 'package:flutter/material.dart';
import '../asyncstate.dart';
=======
import 'package:asyncstate/src/src.dart';
import 'package:flutter/material.dart';
>>>>>>> Stashed changes:lib/src/observers/async_navigator_observer.dart

class AsyncNavigatorObserver extends NavigatorObserver {
  /// This class will observe the routes like push, pop and other. The class will update de context to use in the controller
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // ignore: invalid_use_of_protected_member
    AsyncState.updateContext(navigator!.context);
    if (route.settings.name != null && route.settings.name!.isNotEmpty) {
      // ignore: invalid_use_of_protected_member
      AsyncState.currentRouteName = route.settings.name!;
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    // ignore: invalid_use_of_protected_member
    AsyncState.updateContext(navigator!.context);
    if (newRoute?.settings.name != null &&
        newRoute!.settings.name!.isNotEmpty) {
      // ignore: invalid_use_of_protected_member
      AsyncState.currentRouteName = newRoute.settings.name!;
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // ignore: invalid_use_of_protected_member
    AsyncState.updateContext(navigator!.context);
    if (route.settings.name != null && route.settings.name!.isNotEmpty) {
      // ignore: invalid_use_of_protected_member
      AsyncState.currentRouteName = route.settings.name!;
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    // ignore: invalid_use_of_protected_member
    AsyncState.updateContext(navigator!.context);
    if (previousRoute?.settings.name != null &&
        previousRoute!.settings.name!.isNotEmpty) {
      // ignore: invalid_use_of_protected_member
      AsyncState.currentRouteName = previousRoute.settings.name!;
    }
  }
}
