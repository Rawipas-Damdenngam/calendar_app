import 'package:calendar_app/widgets/calendar_drawer.dart';
import 'package:calendar_app/widgets/event.dart';
import 'package:calendar_app/widgets/task.dart';
import 'package:flutter/material.dart';
import 'package:calendar_app/screens/search_screen.dart';
import 'package:calendar_app/screens/profile_screen.dart';
import 'package:calendar_app/providers/account_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar_app/widgets/calendar.dart';
import 'package:intl/intl.dart';
import 'package:calendar_app/widgets/calendar_month.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();

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
          body: const CalendarMonth(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Scaffold(
                      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: 400,
                                  height: 250,
                                  color:
                                      const Color.fromARGB(255, 250, 250, 250),
                                  margin: const EdgeInsets.only(
                                      top: 650, left: 20, right: 20),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Text(
                                                'Out of office',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(width: 50),
                                              Material(
                                                elevation: 4,
                                                shape: const CircleBorder(),
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: const CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 25,
                                                    child: Icon(
                                                      Icons
                                                          .free_cancellation_outlined,
                                                      color: Colors.blueAccent,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Text(
                                                'Working location',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(width: 50),
                                              Material(
                                                elevation: 4,
                                                shape: const CircleBorder(),
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: const CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 25,
                                                    child: Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        color:
                                                            Colors.blueAccent),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Text(
                                                'Task',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(width: 50),
                                              Material(
                                                elevation: 4,
                                                shape: const CircleBorder(),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        context: context,
                                                        builder: (ctx) =>
                                                            const Task());
                                                  },
                                                  child: const CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 25,
                                                    child: Icon(
                                                        Icons
                                                            .check_circle_outline_outlined,
                                                        color:
                                                            Colors.blueAccent),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Text(
                                              'Event',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(width: 50),
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (ctx) =>
                                                        const Event());
                                              },
                                              child: const CircleAvatar(
                                                radius: 30,
                                                child: Icon(Icons
                                                    .calendar_today_rounded),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
