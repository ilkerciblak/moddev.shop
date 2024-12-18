import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/common/extension/future_extensions.dart';
import 'package:mobile_application/feature/user/presentation/content/_content.dart';
import 'package:mobile_application/feature/user/presentation/screen/sign_up/controller/_controller.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpScreenCubit cb = SignUpScreenCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl * 3),
            child: BlocBuilder<SignUpScreenCubit, SignUpScreenState>(
              bloc: cb,
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignUpFormContent(
                      actionResult: state.signUpResult,
                      onFirstNameChanged: cb.onFirstnameChanged,
                      onLastNameChanged: cb.onLastnameChanged,
                      onEmailChanged: cb.onEmailChanged,
                      onSubmit: () => cb
                          .signUp()
                          .withGoNamedRoute(context, pathName: 'login-screen'),
                    ),
                    const Divider(),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text('Already Have An Account?'),
                        TextButton(
                          onPressed: () => context.goNamed('login-screen'),
                          child: Text(
                            'Login Here',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      )),
    );
  }
}