library asyncstate;

import 'package:asyncstate/src/src.dart';
import 'package:flutter/material.dart';

export 'package:asyncstate/src/src.dart';

extension AsyncLoader<T> on Future<T> {
  //Extension on future to use in async methods
  Future<T> asyncLoader({
    AsyncOverlay? asyncOverlay,
    bool autoHide = true,
  }) async {
    try {
      AsyncState.show(asyncOverlay: asyncOverlay);
      final result = await this;

      // ignore: invalid_use_of_protected_member
      AsyncState.setOverlaySettings = RouteSettings(
        arguments: result,
        // ignore: invalid_use_of_protected_member
        name: AsyncState.getOverlaySettings.value.name,
      );
      if (autoHide) {
        AsyncState.hide(id: asyncOverlay?.id);
      }
      return result;
    } catch (e) {
      // ignore: invalid_use_of_protected_member
      AsyncState.setOverlaySettings = RouteSettings(
        arguments: e,
        // ignore: invalid_use_of_protected_member
        name: AsyncState.getOverlaySettings.value.name,
      );
      if (autoHide) {
        AsyncState.hide(id: asyncOverlay?.id);
      }
      rethrow;
    }
  }
}
