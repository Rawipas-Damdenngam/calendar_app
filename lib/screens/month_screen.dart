import 'package:calendar_app/providers/task_provider.dart';
import 'package:calendar_app/widgets/floating_button.dart';
import 'package:calendar_app/widgets/month.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendar_app/widgets/calendar_drawer.dart';
import 'package:calendar_app/screens/search_screen.dart';
import 'package:calendar_app/screens/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/providers/account_provider.dart';

class MonthScreen extends ConsumerStatefulWidget {
  const MonthScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MonthScreen> createState() => _MonthScreenState();
}

class _MonthScreenState extends ConsumerState<MonthScreen> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  late DateTime selectedDay;
  DateFormat dateFormat = DateFormat('dd');
  DateFormat dateFormat2 = DateFormat('EEE');

  @override
  void initState() {
    super.initState();
    selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(taskProvider);
    return Scaffold(
      drawer: const CalendarDrawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        toolbarHeight: kToolbarHeight,
        leading: Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 5),
                    child: IconButton(
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      color: Colors.black,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        title: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  DateFormat('MMMM').format(selectedDay),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.search),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const SearchScreen()),
                );
              },
            ),
          ),
          const SizedBox(width: 20),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.calendar_today_rounded),
              color: Colors.black,
              onPressed: () {
                // Handle more tap
              },
            ),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: ((context) => const ProfileScreen()),
              );
            },
            child: Align(
              alignment: Alignment.topLeft,
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
          ),
          const SizedBox(width: 35),
        ],
      ),
      body:  MonthWidget(enteredText: ref.read(taskProvider).title,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const FloatingButton(),
            ),
          );
        },
        backgroundColor: Colors.white,
        child: const CircleAvatar(
          foregroundImage: AssetImage('assets/images/plus.png'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
