import 'package:asyncstate/class/async_overlay.dart';
import 'package:asyncstate/class/async_value.dart';
import 'package:asyncstate/class/private_async_helper.dart';
import 'package:asyncstate/widget/loader/async_state_default_loader.dart';
import 'package:flutter/material.dart';

class AsyncOverlayRoute extends OverlayRoute {
  AsyncOverlayRoute({
    super.settings,
  });
  final _settings = const RouteSettings().asyncValue();
  AsyncValue<RouteSettings> get getStreamSettings => _settings;
  final List<AsyncOverlay> _asyncOverlays = [];

  void add(
    AsyncOverlayRoute route, {
    AsyncOverlay? asyncOverlay,
  }) {
    if (_asyncOverlays.isEmpty) {
      _settings.value = settings;
      Navigator.of(PrivateAsyncHelper.context).push(route);
    }
    final overlayEntry = asyncOverlay ?? AsyncStateDefaultLoader();
    _asyncOverlays.add(overlayEntry);
    Navigator.of(PrivateAsyncHelper.context).overlay?.insert(overlayEntry);
  }

  void remove(AsyncOverlayRoute route, {int? id}) {
    final overlay = _asyncOverlays.cast<AsyncOverlay?>().firstWhere(
              (element) => element?.id == id,
              orElse: () => null,
            ) ??
        _asyncOverlays[0];
    _asyncOverlays.remove(overlay);
    overlay.remove();

    Navigator.pop(PrivateAsyncHelper.context);
  }

  @override
  void onPopInvoked(bool didPop) {
    if (_asyncOverlays.isEmpty) {
      _settings.dispose();
    }
    super.onPopInvoked(didPop);
  }

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    return [
      OverlayEntry(
        builder: (context) => const DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black26,
          ),
          child: SizedBox.expand(),
        ),
      ),
    ];
  }

  @override
  bool didPop(result) {
    return _asyncOverlays.isEmpty ? super.didPop(result) : false;
  }
}
