import 'package:flutter/material.dart';
import 'package:calendar_app/screens/home_screen.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

void main() {
  runApp(const Calendar());
}
