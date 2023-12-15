import 'package:asyncstate/asyncstate.dart';
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
            child: builder(AsyncState.context),
          ),
          maintainState: maintainState,
          opaque: false,
        );
}
