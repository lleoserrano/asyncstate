class AsyncStateException with Exception {
  final String exception;

  AsyncStateException.errorContext(
      {this.exception =
          'Context not found. Did you forget to add the AsyncStateClass.observer in your navigatorObservers?'});
}
