import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/user/domain/_domain.dart';

final class UserScreenState {
  final User user;
  final ActionResult<User> actionResult;

  UserScreenState({
    required this.user,
    required this.actionResult,
  });

  factory UserScreenState.initial() => UserScreenState(
        user: User.def(),
        actionResult: const Loading(),
      );

  UserScreenState copyWith({
    User? user,
    ActionResult<User>? actionResult,
  }) {
    return UserScreenState(
      user: user ?? this.user,
      actionResult: actionResult ?? this.actionResult,
    );
  }

  @override
  bool operator ==(covariant UserScreenState other) {
    if (identical(this, other)) return true;

    return other.user == user && other.actionResult == actionResult;
  }

  @override
  int get hashCode => user.hashCode ^ actionResult.hashCode;
}
