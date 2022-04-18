// Get a string or display a string by default
String getString(dynamic data) {
  // Default String
  String unknown = '---';

  try {
    final String? string = data?.toString();
    return (string?.trim().isNotEmpty ?? false) ? string! : unknown;
  } catch (e) {
    return unknown;
  }
}

// Validates if the string is not null and has at least 1 character
bool isNotEmpty(dynamic data) {
  try {
    final String? string = data?.toString();
    return (string?.trim().isNotEmpty ?? false) ? true : false;
  } catch (e) {
    return false;
  }
}
