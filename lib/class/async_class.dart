import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '/exceptions/async_state_exception.dart';
import '/observers/async_navigator_observer.dart';
import 'package:flutter/material.dart';

/// Static class that will start the instance
final AsyncState asyncState = AsyncState();

class AsyncState<T> {
  Widget? defaultDialog;
  BuildContext? context;
  static final _observer = AsyncNavigatorObserver();

  set setContext(BuildContext ctx) => context = ctx;

  //Static Init
  static AsyncNavigatorObserver get observer => _observer;
  static setLoaderPersonalized({
    Widget? defaultLoaderWidget,
  }) =>
      asyncState.defaultDialog = defaultLoaderWidget;

  //Constructor
  AsyncState();

  Future<T> callAsyncLoader(Future<T> futureFunction,
      {Widget? customLoader}) async {
    try {
      return await _callDialog(customLoader, futureFunction);
    } catch (e) {
      rethrow;
    }
  }

  //Private method to call the loading dialog and handle the context.
  Future<T> _callDialog(
    Widget? customLoader,
    Future<T> futureFunction,
  ) async {
    debugPrint(_getStackName('Call'));
    if (context == null) {
      debugPrintStack(
        label: AsyncStateException.errorContext().exception,
      );
      throw AsyncStateException.errorContext();
    }
    //Call both futures as the same time. the Dialog will still open until the futureFunction complete
    final futures = await Future.wait([
      showDialog(
        barrierDismissible: false,
        context: context!,
        useRootNavigator: false,
        builder: (_) => AlertDialog(
            content: WillPopScope(
          child: customLoader ??
              defaultDialog ??
              SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: kIsWeb
                      ? const CircularProgressIndicator()
                      : Platform.isIOS
                          ? const CupertinoActivityIndicator()
                          : const CircularProgressIndicator(),
                ),
              ),
          onWillPop: () async => false,
        )),
      ),
      futureFunction.whenComplete(() {
        Navigator.of(context!).pop();
      }),
    ]);

    debugPrint(_getStackName('Close'));
    return futures[1] as T;
  }

  //Get the stack trace (debug only)
  String _getStackName(String exibe) {
    // print(StackTrace.current.toString());
    final value = StackTrace.current.toString().split('\n');
    value.removeWhere((element) => !element.startsWith('#4'));

    if (value.isEmpty) {
      return '';
    }
    return '$exibe - ' + value[0].substring(2).replaceAll(' ', '');
  }
}
