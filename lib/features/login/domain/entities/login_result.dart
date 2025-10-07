class LoginResult {
  final String accessToken;
  final String expiresAtUtc;
  final String refreshToken;

  LoginResult({
    required this.accessToken,
    required this.expiresAtUtc,
    required this.refreshToken,
  });
}

