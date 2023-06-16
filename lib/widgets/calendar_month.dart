import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarMonth extends ConsumerStatefulWidget {
  const CalendarMonth({Key? key}) : super(key: key);

  @override
  ConsumerState<CalendarMonth> createState() => _CalendarMonthState();
}

class _CalendarMonthState extends ConsumerState<CalendarMonth> {
  @override
  Widget build(BuildContext context) {
    const int startMonth = 1;
    const int endMonth = 12;
    final int year = DateTime.now().year;

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final int month = startMonth + index;
          final DateTime firstDayOfMonth = DateTime(year, month, 1);
          final int daysInMonth = DateTime(year, month + 1, 0).day;
          final List<String> weekChunks = [];
          int currentDay = 1;

          while (currentDay <= daysInMonth) {
            final int remainingDays = daysInMonth - currentDay + 1;
            final int chunkSize = remainingDays < 7 ? remainingDays : 7;
            final DateTime startDay =
                firstDayOfMonth.add(Duration(days: currentDay - 1));
            final DateTime endDay = startDay.add(Duration(days: chunkSize - 1));
            final String formattedRange = '${startDay.day} - ${endDay.day}';
            weekChunks.add(formattedRange);
            currentDay += chunkSize;
          }

          return Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/pizza.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 20,
                    left: 50,
                    child: Text(
                      DateFormat('MMMM').format(firstDayOfMonth),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              for (String range in weekChunks)
                ListTile(
                  title: Text(
                    '${DateFormat('MMMM').format(firstDayOfMonth)} $range',
                  ),
                  onTap: () {
                    // Do something when a chunk of weeks is tapped
                  },
                ),
            ],
          );
        },
        itemCount: endMonth - startMonth + 1,
      ),
    );
  }
}
