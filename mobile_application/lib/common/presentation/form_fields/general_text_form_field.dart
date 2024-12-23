import 'package:flutter/material.dart';
import 'package:mobile_application/common/presentation/form_fields/mixin/_form_field_mixin.dart';
import 'package:mobile_application/common/presentation/form_fields/validators/validation_helper.dart';
import 'package:mobile_application/common/theme/color/app_colors.dart';

class GeneralTextFormField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final List<String? Function(String?)>? validatorList;
  final InputDecoration inputDecoration;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final AutovalidateMode autovalidateMode;
  final String? currentValue;
  final int? maxLength;
  final bool secureInput;
  final TextEditingController? textEditingController;
  final TextInputType keyboardType;
  final bool enabled;

  GeneralTextFormField({
    super.key,
    required this.onChanged,
    required this.inputDecoration,
    this.autovalidateMode = AutovalidateMode.onUnfocus,
    this.secureInput = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.validatorList,
    this.currentFocusNode,
    this.nextFocusNode,
    this.currentValue,
    this.maxLength,
    this.textEditingController,
  }) {
    assert(textEditingController == null || currentValue == null,
        'One of the textEditingController or currentValue parameter should be null');
  }

  @override
  State<GeneralTextFormField> createState() => _GeneralTextFormFieldState();
}

class _GeneralTextFormFieldState extends State<GeneralTextFormField>
    with SecureInputMixin {
  @override
  void initState() {
    secureInput = widget.secureInput;
    super.initState();
  }

  @override
  void dispose() {
    obsecureText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: obsecureText,
      builder: (context, obsecure, child) {
        return TextFormField(
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.primaryBlack),
          controller: widget.textEditingController,
          focusNode: widget.currentFocusNode,
          obscureText: obsecure,
          onChanged: (value) {
            widget.onChanged(value);
          },
          keyboardType: widget.keyboardType,
          initialValue: widget.currentValue,
          autovalidateMode: widget.autovalidateMode,
          maxLength: widget.maxLength,
          enabled: widget.enabled,
          onFieldSubmitted: (_) => widget.nextFocusNode?.requestFocus(),
          decoration: widget.inputDecoration.copyWith(
            suffixIcon: buildObsecurityWidget(),
          ),
          validator: (value) =>
              ValidationHelper.chainValidators(widget.validatorList, value),
        );
      },
    );
  }
}
