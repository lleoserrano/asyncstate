/* import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

class AsyncPageRoute extends MaterialPageRoute {
  AsyncPageRoute({
    required Widget Function(BuildContext) builder,
    required RouteSettings settings,
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
    bool fullscreenDialog = false,
    bool maintainState = true,
  }) : super(
          builder: (context) => PopScope(
            canPop: AsyncState.capPop,
            child: builder(context),
          ),
          settings: settings,
          allowSnapshotting: allowSnapshotting,
          barrierDismissible: barrierDismissible,
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
        );
}
 */