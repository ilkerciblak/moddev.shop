// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/common/presentation/form_fields/validators/string_validators.dart';

class LoginFormContent extends StatefulWidget {
  final ActionResult<void> actionResult;
  final void Function() onSubmit;
  final void Function(String) onUsernameChanged;
  final void Function(String) onPasswordChanged;
  const LoginFormContent({
    super.key,
    required this.actionResult,
    required this.onSubmit,
    required this.onUsernameChanged,
    required this.onPasswordChanged,
  });

  @override
  State<LoginFormContent> createState() => _LoginFormContentState();
}

class _LoginFormContentState extends State<LoginFormContent>
    with GlobalFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: customFormKey,
      child: Column(
        children: [
          TextFormField(),
          GeneralTextFormField(
            onChanged: widget.onUsernameChanged,
            inputDecoration: InputDecoration(),
            validatorList: const [
              StringValidators.correctUsername,
              StringValidators.emptyCheck
            ],
            maxLength: 25,
          ),
          AppSpacing.verticalGapMd,
          GeneralTextFormField(
            onChanged: widget.onPasswordChanged,
            inputDecoration: InputDecoration(),
            validatorList: const [
              StringValidators.correctUsername,
            ],
            maxLength: 25,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedStatefullButton(
                  btnText: 'Login',
                  actionResult: widget.actionResult,
                  backgroundColor: AppColors.primaryGreen,
                  onTap: widget.onSubmit,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
