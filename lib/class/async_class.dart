import '/exceptions/async_state_exception.dart';
import '/observers/async_navigator_observer.dart';
import 'package:flutter/material.dart';

/// Static class that will start the instance
late final AsyncState asyncState;

@protected
class AsyncState<T> {
  final Widget? _defaultDialog;
  BuildContext? context;
  static final _observer = AsyncNavigatorObserver();

  set setContext(BuildContext ctx) => context = ctx;

  //Static Init
  static AsyncNavigatorObserver get observer => _observer;
  static onInitAsyncState({
    Widget? defaultDialogWidget,
  }) =>
      asyncState = AsyncState(
        defaultDialogWidget: defaultDialogWidget ??
            const SizedBox(
                width: 50,
                height: 50,
                child: Center(child: CircularProgressIndicator())),
      );
  //Constructor
  AsyncState({
    required Widget defaultDialogWidget,
  }) : _defaultDialog = defaultDialogWidget;

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
    debugPrint('Call - ${_getStackName()}');
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
          content: customLoader ?? _defaultDialog,
        ),
      ),
      futureFunction.whenComplete(() {
        Navigator.of(context!).pop();
      }),
    ]);

    debugPrint('Close - ${_getStackName()}');
    return futures[1] as T;
  }

  //Get the stack trace (debug only)
  String _getStackName() {
    final value = StackTrace.current.toString().split('\n');
    value.removeWhere((element) => !element.startsWith('#4'));
    if (value.isEmpty) {
      return '';
    }
    return value[0].substring(2).replaceAll(' ', '');
  }
}
