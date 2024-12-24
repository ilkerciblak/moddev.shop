extension StringFormatExtensionX on String {
  String capitializeEachWord() {
    return split(RegExp(r'\s')).map(
      (word) {
        return word[0].toUpperCase() + word.substring(1);
      },
    ).join(' ');
  }
}
