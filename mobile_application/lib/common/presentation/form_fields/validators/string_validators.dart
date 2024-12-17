class StringValidators {
  static String? emptyCheck(String? value) =>
      value != null && value.isNotEmpty ? null : 'This field cannot be empty';

  static String? correctEmail(String? value) =>
      RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value!)
          ? null
          : 'Please enter a valid email pattern';

  static String? correctUsername(String? value) =>
      RegExp(r'^[a-zA-Z][a-zA-Z0-9_]{5,25}$').hasMatch(value!)
          ? null
          : 'Please enter a valid username pattern';

  static String? alowableName(String? value) =>
      RegExp(r'^[A-ZÇĞİÖŞÜ][a-zçğıöşü]+(?: [A-ZÇĞİÖŞÜ][a-zçğıöşü]+)*$')
              .hasMatch(value!)
          ? null
          : 'Please Enter a Valid Birth Name pattern like \'ilker\'';

  static String? passwordCoupleMatching(String? value, String? other) =>
      value?.compareTo(other ?? '') == 0 ? null : 'Passwords Should Match';
}
