import 'package:intl/intl.dart';

class Calendar {
  final String day;
  final String month;
  final String year;
  final DateTime time;

  Calendar(
      {required this.day,
      required this.month,
      required this.year,
      required this.time});

  String get shortTime {
    DateTime today = DateTime.now();
    if (time.year == today.year &&
        time.month == today.month &&
        time.day == today.day) {
      return DateFormat.Hm().format(time);
    } else {
      return DateFormat('d MMM').format(time);
    }
  }

  String get date {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(time.year, time.month, time.day);

    if (messageDate == today) {
      return 'Today';
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else {
      return '{_formatDate(time)}';
    }
  }

  String formatDate(DateTime dateTime) {
    final month = _getMonthName(dateTime.month);
    final day = dateTime.day.toString();
    final year = dateTime.year.toString().substring(2);

    return '$day $month $year';
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
