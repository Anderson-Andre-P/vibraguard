class DecimalFormatter {
  static String formatDecimal(double value) {
    final formattedValue = value.toStringAsFixed(2);
    return formattedValue;
  }
}
