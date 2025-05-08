import 'dart:async';
import 'dart:developer';

import 'package:asyncstate/src/src.dart';
import 'package:flutter/material.dart';

late final AsyncStateCore asyncStateCore;

@protected
class AsyncStateCore {
  final Widget defaultDialog;
  BuildContext? context;
  final bool enableLog;
  String currentRouteName = '';
  final observer = AsyncNavigatorObserver();
  AsyncStateCore({
    required this.defaultDialog,
    this.enableLog = true,
  });
}

sealed class AsyncState {
  static BuildContext? _internalContext;
  static bool _loaderAlreadyOpen = false;
  BuildContext? get context => asyncStateCore.context;

  static Future<dynamic> showLoader({
    Widget? customLoader,
  }) async {
    if (asyncStateCore.context == null) {
      log(
        AsyncStateException.errorContext().exception,
      );
      throw AsyncStateException.errorContext();
    }
    if (_loaderAlreadyOpen) {
      log(
        AsyncStateException.errorLoaderAlreadyOpen().exception,
      );
      return;
    }
    _loaderAlreadyOpen = true;

    if (asyncStateCore.enableLog) {
      log('🏁⏳ AsyncLoader - Opened');
    }
    showDialog(
        barrierDismissible: false,
        context: asyncStateCore.context!,
        useRootNavigator: false,
        useSafeArea: false,
        builder: (internalCtx) {
          _internalContext = internalCtx;
          return PopScope(
            canPop: false,
            child: customLoader ?? asyncStateCore.defaultDialog,
          );
        });
    return;
  }

  static void closeLoader() async {
    if (_internalContext != null) {
      Navigator.of(_internalContext!).pop();
      if (asyncStateCore.enableLog) {
        log('✅⏳ AsyncLoader - Closed');
      }
      _internalContext = null;
      _loaderAlreadyOpen = false;
    }
  }

  //Get the stack trace (debug only)
  /* String _getStackName(String method) {
    final value = StackTrace.current.toString().split('\n');
    value.removeWhere((element) => !element.startsWith('#4'));

    if (value.isEmpty) {
      return '';
    }
    return '$method - ' + value[0].substring(2).replaceAll(' ', '');
  } */
}
