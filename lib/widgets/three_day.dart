import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/providers/task_provider.dart';
import 'package:calendar_app/screens/task_screen.dart';

class ThreeDayWidget extends ConsumerStatefulWidget {
  final String enteredText;
  final DateTime selectedTime2;
  const ThreeDayWidget(
      {super.key, required this.enteredText, required this.selectedTime2});

  @override
  ConsumerState<ThreeDayWidget> createState() => _ThreeDayWidgetState();
}

class _ThreeDayWidgetState extends ConsumerState<ThreeDayWidget> {
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ref.watch(taskProvider);
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 23,
            itemBuilder: (context, index) {
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
                        left: 90,
                        top: 45,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (ctx) => TaskScreen(
                                        enteredText: widget.enteredText,
                                        selectedTime2: widget.selectedTime2,
                                      )),
                            );
                          },
                          child: Container(
                            width: 96,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.blue[600],
                                borderRadius: BorderRadius.circular(5)),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          decoration:
                                              ref.read(taskProvider).isDone
                                                  ? TextDecoration.lineThrough
                                                  : null),
                                      widget.enteredText,
                                      maxLines: null,
                                    ),
                                  ),
                                ],
                              ),
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
            left: 82,
            child: Container(
              width: 1,
              height: 900,
              color: Colors.grey[400],
            ),
          ),
          Positioned(
            top: 0,
            left: 189,
            child: Container(
              width: 1,
              height: 900,
              color: Colors.grey[400],
            ),
          ),
          Positioned(
            top: 0,
            left: 310,
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
