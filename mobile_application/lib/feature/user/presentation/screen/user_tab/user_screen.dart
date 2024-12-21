import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/user/presentation/content/_content.dart';
import 'package:mobile_application/feature/user/presentation/screen/user_tab/controller/user_screen_cubit.dart';
import 'package:mobile_application/feature/user/presentation/screen/user_tab/controller/user_screen_state.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late UserScreenCubit cb;

  @override
  void initState() {
    cb = UserScreenCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Center(
          child: BlocBuilder<UserScreenCubit, UserScreenState>(
            bloc: cb,
            builder: (context, state) {
              return Column(
                children: [
                  ElevatedStatefullButton(
                    btnText: 'again',
                    actionResult: state.actionResult,
                    onTap: () =>
                        cb.getCurrentUser().showActionResultToast(context),
                  ),
                  UserScreenContent(
                    // user: state.user,
                    actionResult: state.actionResult,
                  )
                ],
              );
            },
          ),
        )
      ],
    ));
  }
}
