import 'package:asyncstate/class/private_async_helper.dart';
import 'package:flutter/material.dart';

import '../widget/loader/async_state_default_loader.dart';
import 'async_overlay.dart';

@protected
final class AsyncState {
  static final List<AsyncOverlay?> _asyncOverlays = [];

  static void show({
    AsyncOverlay? asyncOverlay,
  }) {
    if (_asyncOverlays.isEmpty) {
      _openPrivateRoute();
    }
    final overlayEntry = asyncOverlay ?? AsyncStateDefaultLoader();
    _asyncOverlays.add(overlayEntry);

    Navigator.of(PrivateAsyncHelper.context).overlay?.insert(overlayEntry);
  }

  static void hide({int? id}) {
    final overlay = _asyncOverlays.firstWhere(
      (element) => element?.id == id,
      orElse: () => null,
    );
    if (overlay != null) {
      overlay.remove();
      overlay.dispose();
      _asyncOverlays.remove(overlay);
    } else if (_asyncOverlays.isNotEmpty) {
      final overlayOnList = _asyncOverlays.removeAt(0);

      overlayOnList?.remove();
      overlayOnList?.dispose();
    }

    if (_asyncOverlays.isEmpty) {
      _closePrivateRoute();
    }
  }

  static void _openPrivateRoute() {
    showDialog(
      context: PrivateAsyncHelper.context,
      barrierDismissible: false,
      barrierColor: Colors.black26,
      builder: (dialogContext) {
        PrivateAsyncHelper.internalDialogContext = dialogContext;
        return const PopScope(
          canPop: false,
          child: SizedBox.expand(),
        );
      },
    );
  }

  static void _closePrivateRoute() {
    Navigator.pop(PrivateAsyncHelper.internalDialogContext);
  }
}
