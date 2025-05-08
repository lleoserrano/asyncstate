class AsyncStateException implements Exception {
  final String exception;
  AsyncStateException.errorContext({
    this.exception =
        '🚨 Context not found. Did you forget to add the AsyncState.observer in your navigatorObservers?',
  });

  AsyncStateException.errorLoaderAlreadyOpen({
    this.exception =
        '🚨 #SafeWarn Loader already open. Did you forget to close the loader?',
  });

  AsyncStateException.errorLoaderNotOpen({
    this.exception =
        '🚨 #SafeWarn Loader not open. Did you forget to open the loader?',
  });

  @override
  String toString() => exception;
}
