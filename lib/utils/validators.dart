String? validateNotNull(String? text) {
  return (text != null && text.isNotEmpty) ? null : "*Campo obligatorio";
}
