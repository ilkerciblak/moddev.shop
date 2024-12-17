import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/user/presentation/content/_content.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl * 3),
        child: Column(
          children: [
            SignUpFormContent(
              actionResult: const Idle(),
              onSubmit: () {},
              onFirstNameChanged: (val) {},
              onLastNameChanged: (val) {},
              onEmailChanged: (val) {},
            )
          ],
        ),
      )),
    );
  }
}
