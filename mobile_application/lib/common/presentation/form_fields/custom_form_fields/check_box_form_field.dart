// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/_theme.dart';
import 'package:mobile_application/common/presentation/form_fields/validators/validation_helper.dart';

/// Creates aa CheckBoxFormField with a Labeling or a Text Widget.
///
/// - @param [ValueChanged<bool>] onChanged: to do something on value changed
/// - @param [Widget?] label: to constuct a labeling widget
/// - @param [String?] labelText: to consturct a labeling Text widget includes labelText
/// - @param [TextStyle?] labelTextSyle: to define a textStyle to labelText
/// - @param [List<FormFieldValidator<bool>>] validators: to validate input
/// - @param [String?] forceErrorText: to override errorText of validator(s)
/// - @param [AutovalidateMode] autovalidateMode: to set AutovalidateMode of the formField, `predefined as AutovalidateMode.disabled`
///
/// `Asserts` when:
/// - Both `label` and `labelText` is defined. Both arguments are used to construct labeling widget. Do not use both
///
class CheckBoxFormField extends StatelessWidget {
  final ValueChanged<bool> onChanged;
  final Widget? label;
  final String? labelText;
  final TextStyle? labelTextStyle;
  final List<FormFieldValidator<bool>>? validators;
  final String? forceErrorText;
  final AutovalidateMode autovalidateMode;
  CheckBoxFormField({
    super.key,
    required this.onChanged,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.validators,
    this.label,
    this.labelText,
    this.forceErrorText,
    this.labelTextStyle,
  }) {
    assert(label == null || labelText == null,
        'Both label widget and labelText cannot be defined. Do not use both');
    // assert(labelText == null || labelText!.isNotEmpty );
  }

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      validator: (value) => ValidationHelper.chainValidators(validators, value),
      initialValue: false,
      builder: (field) {
        return Row(
          children: [
            Checkbox.adaptive(
              value: field.value,
              onChanged: (value) {
                field.didChange(value);
              },
              activeColor: AppColors.primaryGreen,
              isError: field.hasError,
            ),
            if (labelText != null)
              Expanded(
                child: Text(
                  labelText!,
                  style: labelTextStyle,
                ),
              ),
            if (label != null) Expanded(child: label!)
          ],
        );
      },
    );
  }
}
