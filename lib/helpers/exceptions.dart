class DecodeException implements Exception {
  final String message;

  const DecodeException(this.message);

  @override
  String toString() {
    return 'DecodeException: $message';
  }
}
