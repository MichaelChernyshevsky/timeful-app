class HttpException implements Exception {
  /// Creates a new instance of [HttpException]
  HttpException({
    this.title,
    this.message,
    this.statusCode,
  });

  final String? title;

  final String? message;

  final int? statusCode;
}
