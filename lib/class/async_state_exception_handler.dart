import 'package:flutter/material.dart';

abstract interface class AsyncStateExceptionHandler {
  void onException(
    Object exception,
    StackTrace stackTrace,
    BuildContext context,
  );
}
