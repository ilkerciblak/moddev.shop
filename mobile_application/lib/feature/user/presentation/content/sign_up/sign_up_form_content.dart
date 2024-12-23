// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/user/presentation/content/sign_up/sign_up_form_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/feature/user/presentation/screen/sign_up/controller/_controller.dart';

class SignUpFormContent extends StatelessWidget
    with GlobalFormMixinStl, SignUpFormMixin {
  SignUpFormContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: customFormKey,
      child: Column(
        children: [
          const _EmailFormField(),
          // AppSpacing.verticalGapMd,
          const _NameFormField(),
          const _LastNameFormField(),
          _PasswordField(passwordVal: passwordVal),
          _ConfirmPasswordField(passwordVal: passwordVal),
          const _BirthDateFormField(),
          const _TermsAndPolicyCheckBox(),
          Row(
            children: [
              Expanded(
                child: ElevatedStatefullButton(
                  btnText: 'Sign Up',
                  actionResult:
                      context.read<SignUpScreenCubit>().state.signUpResult,
                  backgroundColor: AppColors.primaryGreen,
                  onTap: () {
                    if (validForm) {
                      context
                          .read<SignUpScreenCubit>()
                          .signUp()
                          .withGoNamedRoute(context, pathName: 'login-screen');
                    }
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _ConfirmPasswordField extends StatelessWidget {
  const _ConfirmPasswordField({
    required this.passwordVal,
  });

  final ValueNotifier<String> passwordVal;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: passwordVal,
      builder: (context, value, child) {
        return GeneralTextFormField(
          onChanged: (value) {},
          secureInput: true,
          inputDecoration: const InputDecoration(
            helperText: '',
            hintText: 'Confirm Password',
          ),
          validatorList: [StringValidators.passwordCoupleMatching(value)],
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.passwordVal,
  });

  final ValueNotifier<String> passwordVal;

  @override
  Widget build(BuildContext context) {
    return GeneralTextFormField(
      onChanged: (value) {
        passwordVal.value = value;
      },
      secureInput: true,
      inputDecoration: const InputDecoration(
        helperText: '',
        hintText: 'Password',
      ),
    );
  }
}

class _TermsAndPolicyCheckBox extends StatelessWidget {
  const _TermsAndPolicyCheckBox();

  @override
  Widget build(BuildContext context) {
    return CheckBoxFormField(
      onChanged: (value) {},
      validators: const [CheckBoxValidations.shouldBeChecked],
      labelText:
          'I agree to the Privacy Policy, Terms of Use and Terms of Service',
    );
  }
}

class _BirthDateFormField extends StatelessWidget {
  const _BirthDateFormField();

  @override
  Widget build(BuildContext context) {
    return DateSelectionFormField(
      onChanged: (value) {},
      label: 'Birth Date',
      lastDate: DateTime.now(),
    );
  }
}

class _LastNameFormField extends StatelessWidget {
  const _LastNameFormField();

  @override
  Widget build(BuildContext context) {
    return GeneralTextFormField(
      onChanged: context.read<SignUpScreenCubit>().onLastnameChanged,
      inputDecoration: const InputDecoration(
        helperText: '',
        hintText: 'Lastname',
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validatorList: const [
        StringValidators.emptyCheck,
        StringValidators.alowableName
      ],
    );
  }
}

class _NameFormField extends StatelessWidget {
  const _NameFormField();

  @override
  Widget build(BuildContext context) {
    return GeneralTextFormField(
      onChanged: context.read<SignUpScreenCubit>().onFirstnameChanged,
      inputDecoration: const InputDecoration(
        helperText: '',
        hintText: 'Name',
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validatorList: const [
        StringValidators.emptyCheck,
        StringValidators.alowableName
      ],
    );
  }
}

class _EmailFormField extends StatelessWidget {
  const _EmailFormField();

  //

  @override
  Widget build(BuildContext context) {
    return GeneralTextFormField(
      onChanged: context.read<SignUpScreenCubit>().onEmailChanged,
      inputDecoration: const InputDecoration(
        helperText: '',
        hintText: 'Email',
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validatorList: const [
        StringValidators.emptyCheck,
        StringValidators.correctEmail,
      ],
    );
  }
}
