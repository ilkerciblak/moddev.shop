import 'package:flutter/material.dart';

mixin SignUpFormMixin<T extends StatefulWidget> on State<T> {
  late final ValueNotifier<String> passwordVal = ValueNotifier<String>('');
}
