import 'dart:html';

import 'package:calendar_app/providers/calendar_provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:googleapis/calendar/v3.dart' as google_calendar;

class CalendarMain {
  String day;
  String number;
  String month;
  String year;

  CalendarMain({required this.day, required this.month, required this.year, required this.number});
}

List<CalendarMain> dummyCalendar = [
  
];
