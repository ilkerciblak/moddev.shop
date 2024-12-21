import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/service/authentication/application/_application.dart';
import 'package:mobile_application/common/service/authentication/data/token_repository.dart';
import 'package:mobile_application/common/service/authentication/domain/_domain.dart';
import 'package:fpdart/fpdart.dart';

final class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationService _service;
  final TokenRepository _tokenRepository;
  final AuthenticationListenable auth =
      GetIt.instance<AuthenticationListenable>();
  AuthenticationRepository(
      {required IAuthenticationService service,
      required TokenRepository tokenRepository})
      : _service = service,
        _tokenRepository = tokenRepository;
  @override
  TaskEither<Exception, void> login(
      {required String username, required String password}) {
    return _service.login(username: username, password: password).flatMap(
      (authResponse) {
        auth.setAuthenticated();
        return _tokenRepository.saveAccessToken(authResponse.accessToken);
      },
    );
  }

  @override
  TaskEither<Exception, void> logout() {
    return _service.logout().flatMap(
      (r) {
        auth.setNot();
        return _tokenRepository.clearTokens();
      },
    );
  }
}
