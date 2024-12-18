import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/authentication/presentation/content/_content.dart';

import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _Header(),
                  AppSpacing.verticalGapHuge2,
                  const LoginFormContent(),
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
    );
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
            style: Theme.of(context).textTheme.titleMedium,
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
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
