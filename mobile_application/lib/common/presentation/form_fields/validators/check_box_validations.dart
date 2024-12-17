final class CheckBoxValidations {
  static String? shouldBeChecked(bool? value) =>
      (value != null && value) ? null : '';
}
