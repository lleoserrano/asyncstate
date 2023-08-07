import 'dart:developer';
import 'package:flutter/material.dart';
import '../enum/enum_loader_type.dart';
import '/exceptions/async_state_exception.dart';
import '/observers/async_navigator_observer.dart';

/// Static class that will start the instance
late final AsyncState asyncState;

class AsyncState<T> {
  Widget defaultDialog;
  BuildContext? context;
  final _observer = AsyncNavigatorObserver();

  set setContext(BuildContext ctx) => context = ctx;

  //Static Init
  AsyncNavigatorObserver get observer => _observer;

  //Constructor
  AsyncState({
    required this.defaultDialog,
  });

  Future<T> callAsyncLoader(
    Future<T> futureFunction, {
    Widget? customLoader,
    LoaderType? loaderType,
  }) async {
    try {
      return await _callDialog(customLoader, futureFunction, loaderType);
    } catch (e) {
      rethrow;
    }
  }

  //Private method to call the loading dialog and handle the context.
  Future<T> _callDialog(
    Widget? customLoader,
    Future<T> futureFunction,
    LoaderType? loaderType,
  ) async {
    log(_getStackName('Call'));
    if (context == null) {
      log(
        AsyncStateException.errorContext().exception,
      );
      throw AsyncStateException.errorContext();
    }

    //Call both futures as the same time. the Dialog will still open until the futureFunction complete
    final futures = await Future.wait(
      [
        _getLoaderType(
          loaderType: loaderType ?? LoaderType.alertDialog,
          customLoader: customLoader,
        ),
        futureFunction.whenComplete(() {
          switch (loaderType) {
            case LoaderType.alertDialog:
              Navigator.of(context!).pop();
              break;
            case LoaderType.snackBar:
              ScaffoldMessenger.of(context!).hideCurrentSnackBar();
              break;
            case LoaderType.materialBanner:
              ScaffoldMessenger.of(context!).hideCurrentMaterialBanner();
              break;
            default:
              Navigator.of(context!).pop();
          }
        }),
      ],
    );

    log(_getStackName('Close'));
    return futures[1];
  }

  Future _getLoaderType({
    required LoaderType loaderType,
    Widget? customLoader,
  }) {
    return switch (loaderType) {
      LoaderType.alertDialog => showDialog(
          barrierDismissible: false,
          context: context!,
          useRootNavigator: false,
          useSafeArea: false,
          builder: (_) => WillPopScope(
            child: customLoader ?? defaultDialog,
            onWillPop: () async => false,
          ),
        ),
      LoaderType.materialBanner => Future.value(
          ScaffoldMessenger.of(context!).showMaterialBanner(
            customLoader as MaterialBanner,
          ),
        ),
      LoaderType.snackBar => Future.value(
          ScaffoldMessenger.of(context!).showSnackBar(
            customLoader as SnackBar,
          ),
        ),
    };
  }

  //Get the stack trace (debug only)
  String _getStackName(String method) {
    final value = StackTrace.current.toString().split('\n');
    value.removeWhere((element) => !element.startsWith('#4'));

    if (value.isEmpty) {
      return '';
    }
    return '$method - ' + value[0].substring(2).replaceAll(' ', '');
  }
}
