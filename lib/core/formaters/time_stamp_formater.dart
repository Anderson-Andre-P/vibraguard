String formatTimestamp(String timestamp) {
  final parts = timestamp.split('T');
  final dateParts = parts[0].split('-');
  final day = dateParts[2];
  final month = dateParts[1];
  final timeParts = parts[1].split(':');
  final hour = timeParts[0];
  final minute = timeParts[1];

  final dayOfWeek = _getDayOfWeekInEnglish(timestamp);

  return '$dayOfWeek\n$day/$month\n$hour:$minute';
}

String _getDayOfWeekInEnglish(String timestamp) {
  final dateTime = DateTime.parse(timestamp);
  final daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  return daysOfWeek[dateTime.weekday];
}
