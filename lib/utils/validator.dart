String? validateNotNull(String? text) {
  return (text != null && text.isNotEmpty) ? null : "*Campo obligatorio";
}

String? validateEmail(String? text) {
  return (text != null && text.isValidEmail())
      ? null
      : "*Ingresa un email válido";
}

String? validatePassword(String? text) {
  return (text != null && text.length >= 8) ? null : "*Minimo 8 caracteres";
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this);
  }
}
