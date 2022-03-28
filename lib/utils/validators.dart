String? validateNotNull(String? text) {
  return (text != null && text.isNotEmpty) ? null : "*Campo obligatorio";
}

String? validateEmail(String? text) {
  return (text != null && text.isValidEmail())
      ? null
      : "*Ingresa un email válido";
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
