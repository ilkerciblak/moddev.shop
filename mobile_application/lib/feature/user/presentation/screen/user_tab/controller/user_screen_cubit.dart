import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/user/domain/_domain.dart';
import 'package:mobile_application/feature/user/presentation/screen/user_tab/controller/user_screen_state.dart';

class UserScreenCubit extends Cubit<UserScreenState> {
  final IUserRepository _userRepository = GetIt.instance<IUserRepository>();
  final TokenRepository _tokenRepository = GetIt.instance<TokenRepository>();

  UserScreenCubit() : super(UserScreenState.initial());

  Future<ActionResult<User>> getCurrentUser() async {
    var accessToken = await _tokenRepository.getAccessToken().run().then(
      (value) {
        return value.fold(
          (l) {
            throw l;
          },
          (r) {
            return r;
          },
        );
      },
    );
    var response =
        await _userRepository.getCurrentUser(accessToken: accessToken).run();

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
}
