// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mobile_application/common/presentation/form_fields/validators/validation_helper.dart';
import 'package:mobile_application/common/theme/_theme.dart';

/// Builds FormField<DateTime> with Date Selection Widget on Tap
///
/// - @param [ValueChanged<DateTime>] onChanged required
/// - @param [DateTime?] currentValue: to set initial value
/// - @param [List<FormFieldValidatos<DateTime>>?] validators: to validate input
/// - @param [String] label: to describe the input, like 'start date'
/// - @param [AutovalidateMode] autoValidateMode: to set autoValidateMode
/// - @param [DateTime] firstDate: to set firstDate can be selected
/// - @param [DateTime] lastDate : to set LastDate can be selected
///
/// [Label] is pre-defined as `Select a Date`.
/// [AutoValidateMode] is pre-defined as `onUserInteraction`
/// [firstDate] is pre-defined as `DateTime.now - 100 YEARS`
/// [lastDate] is pre-defined as `DateTime.now + 100 YEARS`
class DateSelectionFormField extends StatefulWidget {
  final ValueChanged<DateTime> onChanged;
  final DateTime? currentValue;
  final List<FormFieldValidator<DateTime>>? validators;
  final String label;
  final AutovalidateMode autovalidateMode;
  final DateTime? firstDate;
  final DateTime? lastDate;
  const DateSelectionFormField({
    super.key,
    required this.onChanged,
    this.currentValue,
    this.validators = const <FormFieldValidator<DateTime>>[],
    this.label = 'Select a Date',
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.firstDate,
    this.lastDate,
  });

  @override
  State<DateSelectionFormField> createState() => _DateSelectionFormFieldState();
}

class _DateSelectionFormFieldState extends State<DateSelectionFormField> {
  static const Duration _100_YEARS = Duration(days: 365 * 100);
  late DateTime? _selected = widget.currentValue;

  String? get _selectedString {
    return _selected != null ? DateTimeFormat.onlyDate(_selected!) : null;
  }

  TextEditingController get _controller =>
      TextEditingController(text: _selectedString);

  DateTime get firstDate {
    return widget.firstDate != null
        ? widget.firstDate!
        : DateTime.now().subtract(_100_YEARS);
  }

  DateTime get lastDate {
    return widget.lastDate != null
        ? widget.lastDate!
        : DateTime.now().add(_100_YEARS);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      autovalidateMode: widget.autovalidateMode,
      initialValue: widget.currentValue,
      validator: (value) =>
          ValidationHelper.chainValidators(widget.validators, value),
      builder: (field) {
        return _biildHassoWidget(
          context,
          field,
        );
      },
    );
  }

  Widget _biildHassoWidget(
    BuildContext context,
    FormFieldState<DateTime> field,
  ) {
    return TextField(
      controller: _controller,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: AppColors.primaryBlack),
      onTap: () => _showDatePicker(field),
      readOnly: true,
      decoration: InputDecoration(
        // labelText: widget.label,
        hintText: widget.label,
        errorText: field.errorText,
        helperText: '',
        suffixIcon: const Icon(
          Icons.date_range_outlined,
          color: AppColors.primaryGreen,
        ),
      ),
    );
  }

  Future<void> _showDatePicker(FormFieldState<DateTime> field) async {
    final date = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      currentDate: _selected,
    );

    if (date != null) {
      field.didChange(date);

      if (field.validate()) {
        widget.onChanged(date);
        _selected = date;
        _controller.text = _selectedString!;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
