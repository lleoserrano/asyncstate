import 'package:flutter/material.dart';

abstract class AsyncStateExceptionHandler {
  void onException(
    Object exception,
    StackTrace stackTrace,
    BuildContext context,
  );
}
