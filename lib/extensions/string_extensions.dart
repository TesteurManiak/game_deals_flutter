extension StringModifier on String {
  bool toBool() {
    final val = int.tryParse(this) ?? null;
    return val != null && val > 0 ? true : false;
  }

  String storeFormat({String replaceSpaceBy = '-'}) => this
      .singleSpace()
      .replaceAll(RegExp("[^a-zA-Z0-9 -]"), '')
      .replaceAll(' ', replaceSpaceBy)
      .toLowerCase()
      .trim();

  String singleSpace() => this.replaceAll(RegExp(' +'), ' ');

  String removeNonAlphNum({String replaceBy = ''}) =>
      this.replaceAll(RegExp("[^a-zA-Z0-9] "), replaceBy);
}
