<<<<<<< Updated upstream:lib/class/async_loader_handler.dart
import 'dart:async';

import 'package:asyncstate/asyncstate.dart';
=======
/* import 'package:asyncstate/src/src.dart';
>>>>>>> Stashed changes:lib/src/class/async_loader_handler.dart
import 'package:flutter/material.dart';

@protected
final class AsyncState {
  static late OverlayEntry _overlay;


  static void open({
    OverlayEntry? loader,
  }) {
    if (_overlay.mounted) {
      _overlay.remove();
    }

    _overlay = loader ??
        OverlayEntry(
          builder: (context) => const DefaultLoader(),
        );

    Overlay.of(asyncState.context!).insert(_overlay);
  }

  static void close() {
    if (_overlay.mounted) {
      _overlay.remove();
    }
  }
}
 */