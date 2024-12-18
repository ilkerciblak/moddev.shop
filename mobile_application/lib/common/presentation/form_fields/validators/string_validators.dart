class StringValidators {
  static String? emptyCheck(String? value) =>
      value != null && value.isNotEmpty ? null : 'This field cannot be empty';

  static String? correctEmail(String? value) =>
      RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value!)
          ? null
          : 'Please enter a valid email pattern like example@example.com';

  static String? correctUsername(String? value) =>
      RegExp(r'^[a-zA-Z][a-zA-Z0-9_]{4,25}$').hasMatch(value!)
          ? null
          : 'Please enter a valid username pattern';

  static String? alowableName(String? value) =>
      RegExp(r'^[A-ZÇĞİÖŞÜ][a-zçğıöşü]+(?: [A-ZÇĞİÖŞÜ][a-zçğıöşü]+)*$')
              .hasMatch(value!)
          ? null
          : 'Please Enter a Valid Birth Name pattern like \'Ilker\'';

  ///
  /// Creates a Password and Confirm Password Matching Validator
  ///
  /// __[Usage]__:
  /// ```dart
  ///   StringValidators.passwordCoupleMatching(otherPassword)
  /// ```
  ///
  /// it will automatically plug current password input value into it
  ///
  /// __@return__:
  /// - null if passwords match correctly
  /// - ValidationResult 'Password Should Match' if not match correctly
  static String? Function(String?) passwordCoupleMatching(String? value) =>
      (String? other) {
        if (value!.compareTo(other!) != 0) return 'Passwords Should Match';
        return null;
      };
  // value?.compareTo(other ?? '') == 0 ? null : 'Passwords Should Match';
  // ((String? other) {
  //       if (value!.compareTo(other!) != 0) return 'Passwords Should Match';
  //       return null;
  //     }).call(value);
}
