import 'package:flutter/material.dart';

mixin GlobalFormMixin<T extends StatefulWidget> on State<T> {
  final GlobalKey<FormState> customFormKey = GlobalKey<FormState>();

  final ValueNotifier<bool> validFormNotifier = ValueNotifier<bool>(false);

  void validateForm() {
    validFormNotifier.value = customFormKey.currentState?.validate() ?? false;
  }

  bool get validForm => customFormKey.currentState?.validate() ?? false;
}

mixin GlobalFormMixinStl on StatelessWidget {
  final GlobalKey<FormState> customFormKey = GlobalKey<FormState>();

  final ValueNotifier<bool> validFormNotifier = ValueNotifier<bool>(false);

  void validateForm() {
    validFormNotifier.value = customFormKey.currentState?.validate() ?? false;
  }

  bool get validForm => customFormKey.currentState?.validate() ?? false;
}
