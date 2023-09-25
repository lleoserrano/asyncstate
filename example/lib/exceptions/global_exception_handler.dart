import 'dart:developer';

import 'package:asyncstate/asyncstate.dart';
import 'package:example/home/home_exception_model.dart';
import 'package:flutter/material.dart';

class GlobalExceptionHandler implements AsyncStateExceptionHandler {
  @override
  void onException(
    Object exception,
    StackTrace stackTrace,
    BuildContext context,
  ) {
    switch (exception.runtimeType) {
      case HomeExceptionModel:
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(
              exception.toString(),
            ),
          ),
        );
      case _:
        log(exception.toString());
        break;
    }
  }
}
