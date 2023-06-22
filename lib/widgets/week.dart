import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/providers/task_provider.dart';
import 'package:calendar_app/screens/task_screen.dart';

class WeekDayWidget extends ConsumerStatefulWidget {
  final String enteredText;
  final DateTime selectedTime2;
  const WeekDayWidget(
      {super.key, required this.enteredText, required this.selectedTime2});

  @override
  ConsumerState<WeekDayWidget> createState() => _WeekDayWidgetState();
}

class _WeekDayWidgetState extends ConsumerState<WeekDayWidget> {
  DateTime time = DateTime.now();
  int currentHour = DateTime.now().hour;

  @override
  Widget build(BuildContext context) {
    ref.watch(taskProvider);
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 23,
            itemBuilder: (context, index) {
              int day = DateTime.now().day;
              int hour = index + 1;
              String hourString = hour.toString().padLeft(2, '0');

              return Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 80,
                      child: ListTile(
                        title: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('$hourString:00'),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                indent: 8,
                                thickness: 1,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (hour == widget.selectedTime2.hour &&
                        widget.enteredText != '')
                      Positioned(
                        left: 12.3 * day.toDouble(),
                        top: 45,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => TaskScreen(
                                  enteredText: widget.enteredText,
                                  selectedTime2: widget.selectedTime2,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.blue[600],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Icon(
                                      Icons.check_circle_outline,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.enteredText,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      decoration: ref.read(taskProvider).isDone
                                          ? TextDecoration.lineThrough
                                          : null,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            top: 0,
            left: 83,
            child: Container(
              width: 1,
              height: 900,
              color: Colors.grey[400],
            ),
          ),
          Positioned(
            top: 0,
            left: 127,
            child: Container(
              width: 1,
              height: 900,
              color: Colors.grey[400],
            ),
          ),
          Positioned(
            top: 0,
            left: 172,
            child: Container(
              width: 1,
              height: 900,
              color: Colors.grey[400],
            ),
          ),
          Positioned(
            top: 0,
            left: 218,
            child: Container(
              width: 1,
              height: 900,
              color: Colors.grey[400],
            ),
          ),
          Positioned(
            top: 0,
            left: 265,
            child: Container(
              width: 1,
              height: 900,
              color: Colors.grey[400],
            ),
          ),
          Positioned(
            top: 0,
            left: 315,
            child: Container(
              width: 1,
              height: 900,
              color: Colors.grey[400],
            ),
          ),
          Positioned(
            top: 0,
            left: 365,
            child: Container(
              width: 1,
              height: 900,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
