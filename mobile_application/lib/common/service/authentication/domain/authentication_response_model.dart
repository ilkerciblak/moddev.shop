final class AuthenticationResponseModel {
  final int userId;
  final String accessToken;
  final String refreshToken;

  AuthenticationResponseModel({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  bool operator ==(covariant AuthenticationResponseModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode =>
      userId.hashCode ^ accessToken.hashCode ^ refreshToken.hashCode;
}
