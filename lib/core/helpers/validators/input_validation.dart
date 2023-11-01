class InputValidation {
  static bool validateMinimumSentenceLength(String? value) {
    value = value!.trim();
    List<String> words;
    words = value.split(" ");
    if (value.length < 3) return false;
    if (words.length < 2) return false;
    return true;
  }

  static bool validateEmail(String? value) {
    value = value!.trim();
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValid = value.isNotEmpty != true || regex.hasMatch(value);
    return isValid;
  }
}
