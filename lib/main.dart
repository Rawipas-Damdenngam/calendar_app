import 'package:flutter/material.dart';
import 'package:calendar_app/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

void main() {
  runApp(const Calendar());
}
