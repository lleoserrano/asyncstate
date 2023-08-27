import 'dart:developer';

class AsyncStateException implements Exception {
  final String exception;
  //An exception to handle the context error, when you forget to put the observer
  AsyncStateException.errorContext({
    this.exception =
        'Context not found. Did you forget to add the AsyncState.observer in your navigatorObservers?',
  }) {
    log(exception);
  }

  AsyncStateException.errorCustomLoaderSnackbar({
    this.exception =
        'If you use LoaderType.snackBar, you need to pass a SnackBar widget as customLoader',
  }) {
    log(exception);
  }

  AsyncStateException.errorCustomLoaderMaterialBanner({
    this.exception =
        'If you use LoaderType.materialBanner, you need to pass a materialBanner widget as customLoader',
  }) {
    log(exception);
  }

  @override
  String toString() => exception;
}
