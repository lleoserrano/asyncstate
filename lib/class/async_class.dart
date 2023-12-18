import 'package:asyncstate/class/async_overlay_route.dart';
import 'package:flutter/material.dart';

import 'async_overlay.dart';

@protected
final class AsyncState {
  static RouteSettings? _settings;
  @protected
  static RouteSettings? get settings => _settings;
  @protected
  static set settings(RouteSettings? settings) => _settings = settings;

  static var _asyncOverlayRoute = AsyncOverlayRoute();

  static void show({
    AsyncOverlay? asyncOverlay,
    RouteSettings? settings,
  }) {
    _settings = settings;
    if (!_asyncOverlayRoute.isActive) {
      _asyncOverlayRoute = AsyncOverlayRoute(settings: settings);
    }
    _asyncOverlayRoute.add(_asyncOverlayRoute, asyncOverlay: asyncOverlay);
  }

  static void hide({int? id}) {
    _asyncOverlayRoute.remove(_asyncOverlayRoute, id: id);
  }
}
