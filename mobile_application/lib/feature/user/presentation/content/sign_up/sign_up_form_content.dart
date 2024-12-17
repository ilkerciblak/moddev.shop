// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/common/presentation/form_fields/validators/string_validators.dart';

class SignUpFormContent extends StatefulWidget {
  final ActionResult<void> actionResult;
  final void Function() onSubmit;
  final void Function(String) onFirstNameChanged;
  final void Function(String) onLastNameChanged;
  final void Function(String) onEmailChanged;
  const SignUpFormContent({
    super.key,
    required this.actionResult,
    required this.onSubmit,
    required this.onFirstNameChanged,
    required this.onLastNameChanged,
    required this.onEmailChanged,
  });

  @override
  State<SignUpFormContent> createState() => _SignUpFormContentState();
}

class _SignUpFormContentState extends State<SignUpFormContent>
    with GlobalFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: customFormKey,
      child: Column(
        children: [
          GeneralTextFormField(
            onChanged: (value) {},
            inputDecoration: const InputDecoration(
              helperText: '',
              hintText: 'Username',
            ),
            validatorList: const [
              StringValidators.emptyCheck,
              StringValidators.correctUsername,
            ],
          ),
          // AppSpacing.verticalGapMd,
          GeneralTextFormField(
            onChanged: (value) {},
            inputDecoration: const InputDecoration(
              helperText: '',
              hintText: 'Name',
            ),
            validatorList: const [
              StringValidators.emptyCheck,
              StringValidators.alowableName
            ],
          ),
          GeneralTextFormField(
            onChanged: (value) {},
            inputDecoration: const InputDecoration(
              helperText: '',
              hintText: 'Lastname',
            ),
            validatorList: const [
              StringValidators.emptyCheck,
              StringValidators.alowableName
            ],
          ),
          GeneralTextFormField(
            onChanged: (value) {},
            secureInput: true,
            inputDecoration: const InputDecoration(
              helperText: '',
              hintText: 'Password',
            ),
          ),
          GeneralTextFormField(
            onChanged: (value) {},
            secureInput: true,
            inputDecoration: const InputDecoration(
              helperText: '',
              hintText: 'Confirm Password',
            ),
            // validatorList: [],
          ),
          DateSelectionFormField(
            onChanged: (value) {},
            label: 'Birth Date',
            validators: [
              (value) {
                return value != null ? null : 'Please Select a Date!';
              },
              (value) {
                return value!.isAfter(DateTime.now())
                    ? null
                    : 'Date cannot be after than today';
              },
            ],
            lastDate: DateTime.now(),
          ),
          CheckBoxFormField(
            onChanged: (value) {},
            labelText:
                'I agree to the Privacy Policy, Terms of Use and Terms of Service',
          ),
        ],
      ),
    );
  }
}
