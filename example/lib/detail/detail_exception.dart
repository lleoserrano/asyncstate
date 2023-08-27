class DetailException implements Exception {
  final String message;

  DetailException(this.message);
  @override
  String toString() => message;
}
