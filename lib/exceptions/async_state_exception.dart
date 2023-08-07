class AsyncStateException implements Exception {
  final String exception;
  //An exception to handle the context error, when you forget to put the observer
  AsyncStateException.errorContext({
    this.exception =
        'Context not found. Did you forget to add the AsyncState.observer in your navigatorObservers?',
  });
}
