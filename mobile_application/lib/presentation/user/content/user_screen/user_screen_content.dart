import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/user/domain/_domain.dart';
import 'package:mobile_application/presentation/user/screen/user_tab/controller/user_screen_cubit.dart';
import 'package:mobile_application/feature/user/presentation/widget/_widget.dart';

class UserScreenContent extends StatelessWidget
    with ActionResultPresenterMixin<User>, ActionResultSnackbarMixin<User> {
  final ActionResult<User> userFetchResult;

  UserScreenContent({
    super.key,
    required this.userFetchResult,
  }) {
    actionResult = userFetchResult;
  }

  @override
  Widget build(BuildContext context) {
    showResultSnackBar(
      context,
      retry: context.read<UserScreenCubit>().getCurrentUser,
    );
    return buildByStatus(context);
  }

  @override
  Widget buildErrorState(BuildContext context, Exception exception) {
    return buildLoading(context);
  }

  @override
  Widget buildLoading(BuildContext context) {
    return const ShimmerUserScreenHeader();
  }

  @override
  Widget buildSuccess(BuildContext context, value) {
    return Column(
      children: [
        UserScreenHeader(user: value, shrinkOffset: 1),
        TextButton(
          onPressed: () {
            context
                .read<UserScreenCubit>()
                .logout()
                .showActionResultToast(context)
                .withGoNamedRoute(context, pathName: 'login-screen');
          },
          child: const Text('Logout'),
        )
      ],
    );
  }
}
