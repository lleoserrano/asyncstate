library asyncstate;

<<<<<<< Updated upstream
import 'package:asyncstate/class/async_loader_handler.dart';
import 'package:flutter/material.dart';
import 'enum/enum_loader_type.dart';
export 'class/async_class.dart';
export 'mixin/asyncstate_mixin.dart';
export 'class/async_value.dart';
export 'enum/enum_loader_type.dart';
export 'exceptions/async_state_exception.dart';
export 'class/async_loader_handler.dart';
=======
import 'package:asyncstate/asyncstate.dart';
>>>>>>> Stashed changes

export 'package:asyncstate/src/src.dart';

extension AsyncLoader<T> on Future<T> {
  //Extension on future to use in async methods
  Future<T> asyncLoader({
    AsyncOverlay? asyncOverlay,
  }) async {
    try {
      AsyncState.show(asyncOverlay: asyncOverlay);
      final result = await this;
      AsyncState.hide(id: asyncOverlay?.id);
      return result;
    } catch (e) {
      AsyncState.hide(id: asyncOverlay?.id);
      rethrow;
    }
  }
}
/* 
extension AsyncLoaderT on Object {
  void showLoader({
    OverlayEntry? loader,
  }) {
    AsyncState.show(
      loader: loader,
    );
  }

  void hiderLoader() {
    AsyncState.hide();
  }
}

extension AsyncLoaderContext on BuildContext {
  void showLoader({
    OverlayEntry? loader,
  }) {
    AsyncState.show(
      loader: loader,
    );
  }

  void hiderLoader() {
    AsyncState.hide();
  }
} */
