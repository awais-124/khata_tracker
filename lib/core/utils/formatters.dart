import 'package:intl/intl.dart';

class Formatters {
  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  static final DateFormat _timeFormat = DateFormat('HH:mm');
  static final DateFormat _dateTimeFormat = DateFormat('dd/MM/yyyy HH:mm');

  static String formatDate(DateTime date) => _dateFormat.format(date);
  static String formatTime(DateTime time) => _timeFormat.format(time);
  static String formatDateTime(DateTime dateTime) =>
      _dateTimeFormat.format(dateTime);
  static String formatCurrency(double amount) =>
      '₹${amount.toStringAsFixed(2)}';
}
