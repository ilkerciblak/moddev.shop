import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/presentation/authentication/content/_content.dart';

import 'package:go_router/go_router.dart';
import 'package:mobile_application/presentation/authentication/login_screen/controller/_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginScreenCubit cb;

  @override
  void initState() {
    cb = LoginScreenCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSpacing.xxl * 3),
              child: BlocProvider(
                create: (_) => cb,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const _Header(),
                    AppSpacing.verticalGapHuge2,
                    LoginFormContent(),
                    const Divider(),
                    const SocialLoginContent(),
                    const Divider(),
                    const _SignUp()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    cb.close();
    super.dispose();
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text(
          'Don\'t you have an account',
        ),
        TextButton(
          onPressed: () {
            context.pushNamed('register');
          },
          child: Text(
            'Sign Up!',
            style: context.theme.titleMedium,
          ),
        )
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Text(
      'MODULAR SHOP',
      style: context.theme.headlineLarge,
    );
  }
}
