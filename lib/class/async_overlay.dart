import 'package:asyncstate/class/async_class.dart';
import 'package:asyncstate/class/private_async_helper.dart';
import 'package:flutter/material.dart';

typedef Communicate = void Function(RouteSettings? settings);

class AsyncOverlay extends OverlayEntry {
  final int id;

  AsyncOverlay({
    required this.id,
    required Widget Function(
      BuildContext context,
      RouteSettings? settings,
      Communicate communicate,
    ) builder,
    bool maintainState = false,
  }) : super(
          builder: (context) => Material(
            color: Colors.transparent,
            child: builder(
              PrivateAsyncHelper.context,
              // ignore: invalid_use_of_protected_member
              AsyncState.settings,
              (RouteSettings? settings) {
                // ignore: invalid_use_of_protected_member
                AsyncState.settings = settings;
              },
            ),
          ),
          maintainState: maintainState,
          opaque: false,
        );
}
