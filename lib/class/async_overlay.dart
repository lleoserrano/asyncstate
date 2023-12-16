import 'package:asyncstate/class/private_async_helper.dart';
import 'package:flutter/material.dart';

class AsyncOverlay extends OverlayEntry {
  final int id;

  AsyncOverlay({
    required this.id,
    required Widget Function(BuildContext) builder,
    bool maintainState = false,
    bool opaque = true,
  }) : super(
          builder: (context) => Material(
            color: Colors.transparent,
            // ignore: invalid_use_of_protected_member
            child: builder(PrivateAsyncHelper.context),
          ),
          maintainState: maintainState,
          opaque: false,
        );
}
