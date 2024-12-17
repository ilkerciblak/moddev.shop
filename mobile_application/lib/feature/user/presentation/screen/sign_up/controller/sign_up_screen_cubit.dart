import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/result/result.dart';
import 'package:mobile_application/feature/user/domain/_domain.dart';
import 'package:mobile_application/feature/user/presentation/screen/sign_up/controller/sign_up_screen_state.dart';

class SignUpScreenCubit extends Cubit<SignUpScreenState> {
  final IUserRepository _userRepository = GetIt.instance<IUserRepository>();

  SignUpScreenCubit() : super(SignUpScreenState.initial());

  Future<ActionResult<void>> signUp() async {
    emit(state.copyWith(signUpResult: const Loading()));

    var response = await _userRepository.createUser(user: state.user).run();

    response.fold(
      (l) {
        emit(state.copyWith(signUpResult: Failure(l)));
      },
      // ignore: void_checks
      (r) => emit(state.copyWith(signUpResult: Success(() {}))),
    );

    return state.signUpResult;
  }

  void onEmailChanged(String value) {
    emit(state.copyWith(user: state.user.copyWith(email: value)));
  }

  void onFirstnameChanged(String value) {
    emit(state.copyWith(user: state.user.copyWith(firstName: value)));
  }

  void onLastnameChanged(String value) {
    emit(state.copyWith(user: state.user.copyWith(lastName: value)));
  }
}
