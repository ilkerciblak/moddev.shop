import 'package:mobile_application/common/_common.dart';

final class LoginScreenState {
  final String username;
  final String password;
  final ActionResult<void> loginResult;

  LoginScreenState({
    required this.username,
    required this.password,
    required this.loginResult,
  });

  LoginScreenState copyWith({
    String? username,
    String? password,
    ActionResult<void>? loginResult,
  }) {
    return LoginScreenState(
      username: username ?? this.username,
      password: password ?? this.password,
      loginResult: loginResult ?? this.loginResult,
    );
  }

  factory LoginScreenState.initial() => LoginScreenState(
        username: '',
        password: '',
        loginResult: const Idle(),
      );

  @override
  bool operator ==(covariant LoginScreenState other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.loginResult == loginResult;
  }

  @override
  int get hashCode =>
      username.hashCode ^ password.hashCode ^ loginResult.hashCode;
}
