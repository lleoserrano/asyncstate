import 'package:asyncstate/class/async_overlay_route.dart';
import 'package:flutter/material.dart';

import 'async_overlay.dart';
import 'async_value.dart';

@protected
final class AsyncState {
  @protected
  static AsyncValue<RouteSettings> get getOverlaySettings =>
      _asyncOverlayRoute.getStreamSettings;
  @protected
  static set setOverlaySettings(RouteSettings settings) =>
      _asyncOverlayRoute.getStreamSettings.value = settings;

  static var _asyncOverlayRoute = AsyncOverlayRoute();

  static void show({
    AsyncOverlay? asyncOverlay,
    RouteSettings? settings,
  }) {
    if (!_asyncOverlayRoute.isActive) {
      _asyncOverlayRoute = AsyncOverlayRoute(settings: settings);
    }
    _asyncOverlayRoute.add(_asyncOverlayRoute, asyncOverlay: asyncOverlay);
  }

  static void hide({int? id}) {
    _asyncOverlayRoute.remove(_asyncOverlayRoute, id: id);
  }
}
