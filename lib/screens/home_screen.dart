import 'package:calendar_app/widgets/caldendar_drawer.dart';
import 'package:flutter/material.dart';
import 'package:calendar_app/screens/search_screen.dart';
import 'package:calendar_app/screens/profile_screen.dart';
import 'package:calendar_app/providers/account_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const SearchScreen()),
              );
            },
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: const Icon(Icons.calendar_today_rounded),
            color: Colors.black,
            onPressed: () {
              // Handle more tap
            },
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: ((context) => const ProfileScreen()),
              );
            },
            child: CircleAvatar(
              child: Text(
                ref.watch(accountsProvider).first.name[0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 35),
        ],
      ),
    );
  }
}
