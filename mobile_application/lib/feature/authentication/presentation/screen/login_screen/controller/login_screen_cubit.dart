import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/authentication/presentation/screen/login_screen/controller/login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  final IAuthenticationRepository _authenticationRepository =
      GetIt.instance<IAuthenticationRepository>();

  LoginScreenCubit() : super(LoginScreenState.initial());

  void login() async {
    emit(state.copyWith(loginResult: const Loading()));
    var response = await _authenticationRepository
        .login(username: state.username, password: state.password)
        .run();

    response.fold(
      (l) {
        emit(state.copyWith(loginResult: Failure(l)));
      },
      (r) {
        emit(state.copyWith(loginResult: Success(r)));
      },
    );
  }

  void onUsernameChanged(String username) {
    emit(state.copyWith(username: username));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }
}
