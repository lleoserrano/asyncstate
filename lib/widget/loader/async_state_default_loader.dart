import 'package:asyncstate/class/async_overlay.dart';
import 'package:flutter/material.dart';

class AsyncStateDefaultLoader extends AsyncOverlay {
  AsyncStateDefaultLoader()
      : super(
          id: DateTime.now().microsecondsSinceEpoch,
          builder: (context, settings, communicate) => const SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        );
}
