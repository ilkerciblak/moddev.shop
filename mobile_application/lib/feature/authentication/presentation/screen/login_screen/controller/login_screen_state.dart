import 'package:mobile_application/common/_common.dart';

final class LoginScreenState {
  final String username;
  final String password;
  final ActionResult<void> loginResult;
  final bool rememberMe;

  LoginScreenState({
    required this.username,
    required this.password,
    required this.loginResult,
    required this.rememberMe,
  });

  LoginScreenState copyWith({
    String? username,
    String? password,
    ActionResult<void>? loginResult,
    bool? rememberMe,
  }) {
    return LoginScreenState(
      username: username ?? this.username,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      loginResult: loginResult ?? this.loginResult,
    );
  }

  factory LoginScreenState.initial() => LoginScreenState(
        username: '',
        password: '',
        loginResult: const Idle(),
        rememberMe: false,
      );

  @override
  bool operator ==(covariant LoginScreenState other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.rememberMe == rememberMe &&
        other.loginResult == loginResult;
  }

  @override
  int get hashCode =>
      username.hashCode ^
      password.hashCode ^
      rememberMe.hashCode ^
      loginResult.hashCode;
}
