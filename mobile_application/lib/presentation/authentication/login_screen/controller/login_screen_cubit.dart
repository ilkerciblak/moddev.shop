import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/common/service/shared_preferences/shared_preferences_manager.dart';
import 'package:mobile_application/presentation/authentication/login_screen/controller/login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  final IAuthenticationRepository _authenticationRepository =
      GetIt.instance<IAuthenticationRepository>();
  final EncryptedSecureStorageService _secureStorageService =
      GetIt.instance<EncryptedSecureStorageService>();
  final SharedPreferencesManager _sharedPreferencesManager =
      GetIt.instance<SharedPreferencesManager>();

  LoginScreenCubit() : super(LoginScreenState.initial()) {
    setSavedCredentials();
  }

  void setSavedCredentials() async {
    emit(state.copyWith(screenAction: const Loading()));

    var username = await _secureStorageService.getString(key: 'username');
    var password = await _secureStorageService.getString(key: 'password');
    var rememberMe = _sharedPreferencesManager.getBool('rememberMe');

    emit(
      state.copyWith(
        username: username,
        password: password,
        rememberMe: rememberMe,
        screenAction: const Success(),
      ),
    );
  }

  Future<ActionResult<void>> login() async {
    emit(state.copyWith(screenAction: const Loading()));
    var response = await _authenticationRepository
        .login(username: state.username, password: state.password)
        .run();

    response.fold(
      (l) {
        emit(state.copyWith(screenAction: Failure(l)));
        return Failure(l);
      },
      (r) {
        emit(
          state.copyWith(
            screenAction: const Success(),
          ),
        );

        return const Success();
      },
    );

    await setRemember();
    return state.screenAction;
  }

  Future<void> setRemember() async {
    if (state.rememberMe && state.screenAction.isSuccess) {
      await _secureStorageService.setString(
          key: 'username', value: state.username);
      await _secureStorageService.setString(
          key: 'password', value: state.password);
      await _sharedPreferencesManager.saveBool('rememberMe', true);
    }
  }

  void onUsernameChanged(String username) {
    emit(state.copyWith(username: username));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void onRememberMeChanged(bool val) {
    emit(state.copyWith(rememberMe: val));
  }
}
