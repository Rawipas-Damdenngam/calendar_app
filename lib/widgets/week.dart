import 'package:flutter/material.dart';

class WeekDayWidget extends StatefulWidget {
  const WeekDayWidget({super.key});

  @override
  State<WeekDayWidget> createState() => _WeekDayWidgetState();
}

class _WeekDayWidgetState extends State<WeekDayWidget> {
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

              return ListTile(
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
