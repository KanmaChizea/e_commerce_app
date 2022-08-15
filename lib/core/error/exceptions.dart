class AuthFailedException implements Exception {
  final String code;
  final String? message;
  AuthFailedException({
    required this.code,
    required this.message,
  });
}
