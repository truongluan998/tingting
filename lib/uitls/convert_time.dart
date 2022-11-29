import 'package:intl/intl.dart';

class ConvertTime {
  static String convertToDMY(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  static String convertToHMS(DateTime dateTime) {
    final DateFormat formatter = DateFormat('Hms');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }
}
