import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';

<<<<<<< Updated upstream:lib/class/async_class.dart
import '/exceptions/async_state_exception.dart';
import '/observers/async_navigator_observer.dart';
import '../enum/enum_loader_type.dart';
=======
@protected
final class AsyncState {
  static final List<AsyncOverlay?> _asyncOverlays = [];
  static BuildContext? _context;
  static late String _currentRouteName;
  static bool get capPop => _asyncOverlays.isEmpty;
  static BuildContext? _internalDialogContext;
>>>>>>> Stashed changes:lib/src/class/async_class.dart

  @protected
  static void updateContext(BuildContext? ctx) => _context = ctx;
  static BuildContext get context => _context!;

  @protected
  static set currentRouteName(String currentRouteName) =>
      _currentRouteName = currentRouteName;

  static String get currentRouteName => _currentRouteName;

  static void show({
    AsyncOverlay? asyncOverlay,
  }) {
    if (_asyncOverlays.isEmpty) {
      _openPrivateRoute();
    }
    final overlayEntry = asyncOverlay ?? AsyncStateDefaultLoader();
    _asyncOverlays.add(overlayEntry);

    Navigator.of(context).overlay?.insert(overlayEntry);
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
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black26,
      builder: (dialogContext) {
        _internalDialogContext = dialogContext;
        return const PopScope(
          canPop: false,
          child: SizedBox.expand(),
        );
      },
    );
  }

  static void _closePrivateRoute() {
    Navigator.pop(_internalDialogContext!);
  }
}

class MyPopEntry extends PopEntry {
  @override
  ValueListenable<bool> get canPopNotifier {
    print('Call canPopNotifier');
    return ValueNotifier(false);
  }

  @override
  PopInvokedCallback? get onPopInvoked => (canPop) {
        print('Pop Invoked');
      };
}
