import 'package:mobile_application/common/_common.dart';
import 'package:fpdart/fpdart.dart';

final class DummyAuthenticationService implements IAuthenticationService {
  final IApiService _apiService;

  DummyAuthenticationService({required IApiService apiService})
      : _apiService = apiService;
  @override
  TaskEither<Exception, AuthenticationResponseModel> login(
      {required String username, required String password}) {
    return _apiService.login(username: username, password: password).map(
      (r) {
        return AuthenticationResponseModel(
          userId: r['id'],
          accessToken: r['accessToken'],
          refreshToken: r['refreshToken'],
        );
      },
    );
  }

  @override
  TaskEither<Exception, void> logout() {
    return TaskEither.right(() {});
  }
}
