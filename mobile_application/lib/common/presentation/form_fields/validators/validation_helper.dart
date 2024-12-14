class ValidationHelper {
  static String? chainValidators<T>(
    List<String? Function(T)>? validators,
    T value,
  ) {
    return validators?.fold(
      null,
      (lastValidationResult, nextValidator) {
        return lastValidationResult ?? nextValidator.call(value);
      },
    );
  }
}
