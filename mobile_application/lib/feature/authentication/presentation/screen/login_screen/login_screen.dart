import 'package:flutter/material.dart';
import 'package:mobile_application/feature/authentication/presentation/screen/login_screen/controller/_controller.dart';
import 'package:mobile_application/feature/authentication/presentation/content/_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder<LoginScreenCubit, LoginScreenState>(
            bloc: cb,
            builder: (context, state) {
              return LoginFormContent(
                actionResult: state.loginResult,
                onSubmit: cb.login,
                onUsernameChanged: cb.onUsernameChanged,
                onPasswordChanged: cb.onPasswordChanged,
              );
            },
          ),
        ),
      ),
    );
  }
}
