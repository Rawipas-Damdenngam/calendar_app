import 'package:calendar_app/widgets/day.dart';
import 'package:calendar_app/widgets/floating_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendar_app/widgets/calendar_drawer.dart';
import 'package:calendar_app/screens/search_screen.dart';
import 'package:calendar_app/screens/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/providers/account_provider.dart';
import 'package:calendar_app/providers/calendar_provider.dart';
import 'package:calendar_app/widgets/calendar.dart';

class Day extends ConsumerStatefulWidget {
  const Day({super.key});

  @override
  ConsumerState<Day> createState() => _DayState();
}

class _DayState extends ConsumerState<Day> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateFormat dateFormat = DateFormat('dd');
  DateFormat dateFormat2 = DateFormat('EEE');

  double appBarHeight = kToolbarHeight;
  bool isExpanded = false;

  void _increaseAppbarHeight() {
    setState(
      () {
        isExpanded = !isExpanded;
        appBarHeight = isExpanded ? 400 : kToolbarHeight;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          drawer: const CalendarDrawer(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(isExpanded ? 400 : kToolbarHeight),
            child: AppBar(
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
                onTap: () {
                  _increaseAppbarHeight();
                },
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
                    Icon(
                      isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
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
                        MaterialPageRoute(
                            builder: (ctx) => const SearchScreen()),
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
              flexibleSpace: isExpanded ? const CalendarWidget() : null,
            ),
          ),
          body: Column(
            children: [
              AppBar(
                centerTitle: false,
                leading: null,
                leadingWidth: 0,
                backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                title: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 15,
                          child: Text(
                            dateFormat.format(selectedDay),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Container(
                          width: 1,
                          height: 56,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Nothing Planned',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[500]),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      left: 13,
                      child: Text(
                        dateFormat2.format(selectedDay),
                        style: const TextStyle(
                            fontSize: 12, color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: DayWidget(),
              )
            ],
          ),
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
        ),
      ],
    );
  }
}
