import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarMain extends StatelessWidget {
  const CalendarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const daysPerWeek = 7;
    const startMonth = 1;
    const endMonth = 12;
    const startYear = 2000;
    const endYear = 2030;

    return ListView.builder(
      itemBuilder: (context, index) {
        final year = endYear - startYear;
        final monthIndex = year * 12 ~/ 360;
        final startDay = (index % daysPerWeek) + 1;
        final endWeek = startDay + daysPerWeek;

        final startDate = DateTime(year, monthIndex, startDay);
        final endDate = DateTime(year, monthIndex, endWeek);

        final formattedStartDate = DateFormat('MMMM d').format(startDate);
        final formattedEndDate = DateFormat('d').format(endDate);

        final isFirstWeekOfMonth = startDay <= monthIndex;

        return Column(
          children: [
            if (isFirstWeekOfMonth)
              Image.asset(
                'assets/images/google.jpeg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ListTile(
              title: Text('$formattedStartDate - $formattedEndDate'),
              // Add other widgets/components as needed
            ),
          ],
        );
      },
      itemCount: daysPerWeek * endMonth * (endYear - startYear + 1),
    );
  }
}
