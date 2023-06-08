import 'package:calendar_app/widgets/caldendar_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CalendarDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        leading: Row(
          children: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.black,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              // Handle search tap
            },
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today_rounded),
            color: Colors.black,
            onPressed: () {
              // Handle more tap
            },
          ),
        ],
      ),
    );
  }
}
