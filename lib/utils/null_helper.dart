String getString(dynamic data) {
  String unknown = '---';

  try {
    final String? string = data?.toString();
    return (string?.trim().isNotEmpty ?? false) ? string! : unknown;
  } catch (e) {
    return unknown;
  }
}
