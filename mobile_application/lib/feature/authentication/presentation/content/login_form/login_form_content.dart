// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/common/extension/future_extensions.dart';
import 'package:mobile_application/feature/authentication/presentation/screen/login_screen/controller/_controller.dart';

class LoginFormContent extends StatefulWidget {
  const LoginFormContent({
    super.key,
  });

  @override
  State<LoginFormContent> createState() => _LoginFormContentState();
}

class _LoginFormContentState extends State<LoginFormContent>
    with GlobalFormMixin {
  late final LoginScreenCubit cb;

  @override
  void initState() {
    cb = LoginScreenCubit();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenCubit, LoginScreenState>(
      bloc: cb,
      builder: (context, state) {
        return Form(
          key: customFormKey,
          child: Column(
            key: Key(state.screenAction.hashCode.toString()),
            children: [
              GeneralTextFormField(
                onChanged: cb.onUsernameChanged,
                inputDecoration: const InputDecoration(
                  hintText: 'Username',
                  helperText: '',
                ),
                validatorList: const [
                  StringValidators.correctUsername,
                  StringValidators.emptyCheck
                ],
                maxLength: 25,
                currentValue: state.username,
              ),
              AppSpacing.verticalGapMd,
              GeneralTextFormField(
                onChanged: cb.onPasswordChanged,
                secureInput: true,
                inputDecoration: const InputDecoration(
                  hintText: 'Password',
                  helperText: '',
                ),
                currentValue: state.password,
                validatorList: const [
                  StringValidators.emptyCheck,
                ],
                // maxLength: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckBoxFormField(
                      onChanged: cb.onRememberMeChanged,
                      labelText: 'Remember me',
                      initialValue: state.rememberMe,
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text('HAH IDIOT XD'),
                        //   ),
                        // );
                      },
                      child: const Text('Forgotten Password'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedStatefullButton(
                      btnText: 'Login',
                      actionResult: state.screenAction,
                      backgroundColor: AppColors.primaryGreen,
                      onTap: () {
                        if (validForm) {
                          cb
                              .login()
                              .showActionResultToast(context)
                              .withGoNamedRoute(
                                context,
                                pathName: 'shop-screen',
                              );
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
