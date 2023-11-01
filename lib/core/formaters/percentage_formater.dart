class PercentageFormatter {
  static String formatAsPercentage(dynamic value) {
    if (value is int) {
      return '$value%';
    } else if (value is double) {
      final percentage = value * 100;
      return '$percentage%';
    } else {
      throw ArgumentError(
          'O valor deve ser um número inteiro ou de ponto flutuante.');
    }
  }
}
