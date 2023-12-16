import 'package:asyncstate/class/private_async_helper.dart';
import 'package:flutter/material.dart';

class AsyncNavigatorObserver extends NavigatorObserver {
  /// This class will observe the routes like push, pop and other. The class will update de context to use in the controller
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // ignore: invalid_use_of_protected_member
    PrivateAsyncHelper.context = navigator!.context;
    if (route.settings.name != null && route.settings.name!.isNotEmpty) {
      // ignore: invalid_use_of_protected_member
      PrivateAsyncHelper.currentRouteName = route.settings.name!;
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    // ignore: invalid_use_of_protected_member
    PrivateAsyncHelper.context = navigator!.context;
    if (newRoute?.settings.name != null &&
        newRoute!.settings.name!.isNotEmpty) {
      // ignore: invalid_use_of_protected_member
      PrivateAsyncHelper.currentRouteName = newRoute.settings.name!;
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // ignore: invalid_use_of_protected_member
    PrivateAsyncHelper.context = navigator!.context;
    if (route.settings.name != null && route.settings.name!.isNotEmpty) {
      // ignore: invalid_use_of_protected_member
      PrivateAsyncHelper.currentRouteName = route.settings.name!;
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    // ignore: invalid_use_of_protected_member
    PrivateAsyncHelper.context = navigator!.context;
    if (previousRoute?.settings.name != null &&
        previousRoute!.settings.name!.isNotEmpty) {
      // ignore: invalid_use_of_protected_member
      PrivateAsyncHelper.currentRouteName = previousRoute.settings.name!;
    }
  }
}
