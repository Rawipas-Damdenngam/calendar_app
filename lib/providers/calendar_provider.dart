import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Calendars {
  DateTime date = DateTime.now();
  Calendars({required this.date});
}

class CalendarsNotifier extends StateNotifier<Calendars> {
  CalendarsNotifier() : super(Calendars(date: DateTime.now()));

  
}

final calendarsProvider = StateNotifierProvider<CalendarsNotifier, Calendars>(
  (ref) => CalendarsNotifier(),
);
