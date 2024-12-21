import 'package:flutter/foundation.dart';

final class AuthenticationListenable extends ChangeNotifier {
  late AuthenticationStatus _status;

  AuthenticationListenable({required AuthenticationStatus status})
      : _status = status;

  void setNot() {
    _status = AuthenticationStatus.not;
    notifyListeners();
  }

  void setAuthenticated() {
    _status = AuthenticationStatus.authenticated;
    notifyListeners();
  }

  factory AuthenticationListenable.initial() =>
      AuthenticationListenable(status: AuthenticationStatus.not);
}

enum AuthenticationStatus {
  not,
  authenticated,
  expired,
}
