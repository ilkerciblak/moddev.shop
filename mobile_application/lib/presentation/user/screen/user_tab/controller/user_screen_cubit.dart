import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/user/domain/_domain.dart';
import 'package:mobile_application/presentation/user/screen/user_tab/controller/user_screen_state.dart';

class UserScreenCubit extends Cubit<UserScreenState> {
  final IUserRepository _userRepository = GetIt.instance<IUserRepository>();
  final IAuthenticationRepository _authenticationRepository =
      GetIt.instance<IAuthenticationRepository>();
  final TokenRepository _tokenRepository = GetIt.instance<TokenRepository>();

  UserScreenCubit() : super(UserScreenState.initial()) {
    getCurrentUser();
  }

  Future<ActionResult<User>> getCurrentUser() async {
    emit(state.copyWith(actionResult: const Loading()));

    var response = await _tokenRepository.getAccessToken().flatMap(
      (r) {
        return _userRepository.getCurrentUser(accessToken: r);
      },
    ).run();

    response.fold(
      (l) {
        emit(
          state.copyWith(
            actionResult: Failure<User>(l),
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            actionResult: Success<User>(r),
          ),
        );
      },
    );

    return state.actionResult;
  }

  Future<ActionResult<void>> logout() async {
    var response = await _authenticationRepository.logout().run();

    return response.fold(
      (l) => Failure(l),
      (r) => const Success(),
    );
  }
}
