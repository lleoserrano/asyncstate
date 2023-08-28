import 'dart:developer';

import 'package:asyncstate/asyncstate.dart';
import 'package:example/detail/detail_exception.dart';
import 'package:flutter/material.dart';

class DetailExceptionHandler implements AsyncStateExceptionHandler {
  @override
  void onException(
    Object exception,
    StackTrace stackTrace,
    BuildContext context,
  ) {
    switch (exception.runtimeType) {
      case DetailException:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
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
