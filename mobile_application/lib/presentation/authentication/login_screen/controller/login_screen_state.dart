import 'package:mobile_application/common/_common.dart';

class LoginScreenState {
  final String username;
  final String password;
  final ActionResult<void> screenAction;
  final bool rememberMe;

  LoginScreenState({
    required this.username,
    required this.password,
    required this.screenAction,
    required this.rememberMe,
  });

  LoginScreenState copyWith({
    String? username,
    String? password,
    ActionResult<void>? screenAction,
    bool? rememberMe,
  }) {
    return LoginScreenState(
      username: username ?? this.username,
      password: password ?? this.password,
      screenAction: screenAction ?? this.screenAction,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  factory LoginScreenState.initial() => LoginScreenState(
        username: '',
        password: '',
        screenAction: const Idle(),
        rememberMe: false,
      );

  @override
  bool operator ==(covariant LoginScreenState other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.screenAction == screenAction &&
        other.rememberMe == rememberMe;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        screenAction.hashCode ^
        rememberMe.hashCode;
  }
}
