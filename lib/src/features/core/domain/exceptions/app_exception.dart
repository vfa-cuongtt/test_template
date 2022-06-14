class AppException implements Exception {
  const AppException([this.message]);
  final dynamic message;

  @override
  String toString() {
    final Object? message = this.message;
    if (message == null) return 'Exception';
    return 'Exception: $message';
  }
}
