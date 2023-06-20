import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthWidget extends StatefulWidget {
  const MonthWidget({Key? key}) : super(key: key);

  @override
  State<MonthWidget> createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {
  final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final DateFormat dayFormat = DateFormat('d');

    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 30,
            width: double.infinity,
            decoration:
                const BoxDecoration(color:  Color.fromARGB(255, 250, 250, 250)),
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      final dayIndex =
                          (index + DateTime.monday) % DateTime.daysPerWeek;
                      final dayName = DateFormat.E()
                          .format(DateTime(2022, 1, dayIndex + 1))[0];
                      final isCurrentDay =
                          DateTime.now().weekday == dayIndex - 1;

                      return Padding(
                        padding:const  EdgeInsets.symmetric(horizontal: 25.5),
                        child: Center(
                          child: Text(
                            dayName,
                            style: TextStyle(
                              color:
                                  isCurrentDay ? Colors.blue : Colors.grey[600],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 750, // Set a fixed height for the container
            child: GridView.builder(
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio:
                    0.5, // Adjust the aspect ratio for taller items
              ),
              itemCount: DateTime.daysPerWeek * 6, // Display 6 weeks
              itemBuilder: (context, index) {
                final firstDayOfMonth =
                    DateTime(_selectedDate.year, _selectedDate.month, 1);
                final firstWeekdayOfMonth = firstDayOfMonth.weekday;
                final selectedDay = index + 1 - firstWeekdayOfMonth;
                final currentDate = DateTime(
                    _selectedDate.year, _selectedDate.month, selectedDay);

                final isSelectedMonth =
                    currentDate.month == _selectedDate.month;
                final isCurrentDay = currentDate.day == DateTime.now().day;

                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      color: Colors.white),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          dayFormat.format(currentDate),
                          style: TextStyle(
                            color: isSelectedMonth
                                ? Colors.black
                                : Colors.grey[600],
                          ),
                        ),
                      ),
                      if (isCurrentDay)
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(dayFormat.format(currentDate),
                                  style: const TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
