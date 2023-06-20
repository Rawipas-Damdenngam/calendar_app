import 'package:flutter/material.dart';
import 'package:calendar_app/screens/task_screen.dart';

class DayWidget extends StatefulWidget {
  const DayWidget(
      {required this.enteredText, required this.selectedTime2, super.key});
  final String enteredText;
  final DateTime selectedTime2;
  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 23,
            itemBuilder: (context, index) {
              int hour = index + 1;
              String hourString = hour.toString().padLeft(2, '0');

              return Expanded(
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
                      if (hour == widget.selectedTime2.hour)
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 38.0, top: 0),
                            child: Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => TaskScreen(
                                        enteredText: widget.enteredText,
                                        time: widget.selectedTime2,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 300,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[600],
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                    widget.enteredText,
                                    maxLines: null,
                                  ),
                                ),
                              ),
                            ),
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
              );
            },
          ),
          Positioned(
            top: 0,
            left: 88,
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
