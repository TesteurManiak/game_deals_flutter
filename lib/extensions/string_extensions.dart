extension StringModifier on String {
  bool toBool() {
    final val = int.tryParse(this) ?? null;
    return val != null && val > 0 ? true : false;
  }

  String storeFormat() => this
      .replaceAll(' ', '-')
      .replaceAll(RegExp("[^a-zA-Z0-9 -]"), '')
      .toLowerCase()
      .trim();
}
