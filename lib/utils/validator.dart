// Validate that the string is not null
String? validateNotNull(String? text) {
  return (text != null && text.isNotEmpty) ? null : "*Campo obligatorio";
}

// Validate that the string is an email
String? validateEmail(String? text) {
  return (text != null && text.isValidEmail())
      ? null
      : "*Ingresa un email válido";
}

// Verify that the string has a minimum of characters
String? validatePassword(String? text) {
  // Minimum characters
  int length = 8;

  return (text != null && text.length >= length)
      ? null
      : "*Minimo $length caracteres";
}

// Adds a method to the string class to validate email addresses
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this);
  }
}
