import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String formatDateTime(String dateTimeString) {
    final dateTime = DateTime.tryParse(dateTimeString);
    if (dateTime != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      final formattedTime = DateFormat('HH:mm:ss').format(dateTime);
      return '$formattedDate in $formattedTime';
    } else {
      return 'Invalid Date';
    }
  }
}
