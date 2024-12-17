import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/user/domain/_domain.dart';

class SignUpScreenState {
  final User user;
  final ActionResult<void> signUpResult;

  SignUpScreenState({
    required this.user,
    required this.signUpResult,
  });

  factory SignUpScreenState.initial() => SignUpScreenState(
        user: User.def(),
        signUpResult: const Idle(),
      );

  SignUpScreenState copyWith({
    User? user,
    ActionResult<void>? signUpResult,
  }) {
    return SignUpScreenState(
      user: user ?? this.user,
      signUpResult: signUpResult ?? this.signUpResult,
    );
  }

  @override
  bool operator ==(covariant SignUpScreenState other) {
    if (identical(this, other)) return true;

    return other.user == user && other.signUpResult == signUpResult;
  }

  @override
  int get hashCode => user.hashCode ^ signUpResult.hashCode;
}
