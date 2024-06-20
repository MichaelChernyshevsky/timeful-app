class AuthException implements Exception {
  /// Creates a new instance of [HttpException]
  AuthException({
    this.title,
    this.message,
    this.statusCode,
  });

  final String? title;

  final String? message;

  final int? statusCode;
}
