import 'package:flutter/material.dart';

class DayWidget extends StatefulWidget {
  const DayWidget({super.key});

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
            itemCount: 24,
            itemBuilder: (context, index) {
              int hour = index;
              String hourString = hour.toString().padLeft(2, '0');

              return ListTile(
                title: Row(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('${hourString}:00')),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 23.0),
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 1,
                    //     color: Colors.grey[400],
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
