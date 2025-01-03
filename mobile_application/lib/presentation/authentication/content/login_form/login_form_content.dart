// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/presentation/authentication/login_screen/controller/_controller.dart';

class LoginFormContent extends StatelessWidget with GlobalFormMixinStl {
  LoginFormContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenCubit, LoginScreenState>(
      bloc: context.read<LoginScreenCubit>(),
      builder: (context, state) {
        return Form(
          key: customFormKey,
          child: Column(
            key: Key(state.screenAction.hashCode.toString()),
            children: [
              GeneralTextFormField(
                onChanged: context.read<LoginScreenCubit>().onUsernameChanged,
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
                enabled: !state.screenAction.isLoading,
              ),
              AppSpacing.verticalGapMd,
              GeneralTextFormField(
                onChanged: context.read<LoginScreenCubit>().onPasswordChanged,
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
                      onChanged:
                          context.read<LoginScreenCubit>().onRememberMeChanged,
                      labelText: 'Remember me',
                      initialValue: state.rememberMe,
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.showErrorToast(message: 'HAH IDIOT XD');
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
                          context
                              .read<LoginScreenCubit>()
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
