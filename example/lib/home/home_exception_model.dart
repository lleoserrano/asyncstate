class HomeExceptionModel implements Exception {
  final String message;

  HomeExceptionModel(this.message);
  @override
  String toString() => message;
}
