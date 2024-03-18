import 'package:flutter/material.dart';

sealed class DetailPageHandlerException {
  static onError(
    Object error,
    StackTrace stackTrace,
    BuildContext? context,
    RouteSettings? routeSettings,
  ) {
    if (context != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(error.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            )
          ],
        ),
      );
    }
  }
}
