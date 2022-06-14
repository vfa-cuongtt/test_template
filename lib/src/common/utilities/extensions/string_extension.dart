extension StringExtension on String {
  String capitalize() {
    if (length == 0) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map<String>((String str) => str.capitalize())
      .join(' ');
}

extension StringNullableExtension on String? {
  String defaultTo(String defaultValue) {
    if (this == null) {
      return defaultValue;
    }
    return this!;
  }
}
