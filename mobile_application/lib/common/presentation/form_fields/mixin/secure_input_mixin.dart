import 'package:flutter/material.dart';

mixin SecureInputMixin<T extends StatefulWidget> on State<T> {
  late final bool secureInput;

  late final ValueNotifier<bool> obsecureText =
      ValueNotifier<bool>(secureInput);

  Widget? buildObsecurityWidget() {
    return secureInput ? buildVisibilityBtn() : null;
  }

  Widget buildVisibilityBtn() {
    return ValueListenableBuilder(
      valueListenable: obsecureText,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () => obsecureText.value = !obsecureText.value,
          child: obsecureText.value
              ? const Icon(Icons.visibility_outlined)
              : const Icon(Icons.visibility_off_outlined),
        );
      },
    );
  }
}
