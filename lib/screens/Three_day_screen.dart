import 'package:calendar_app/widgets/Three_day.dart';
import 'package:calendar_app/widgets/floating_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendar_app/widgets/calendar_drawer.dart';
import 'package:calendar_app/screens/search_screen.dart';
import 'package:calendar_app/screens/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/providers/account_provider.dart';
import 'package:calendar_app/widgets/calendar.dart';

class ThreeDayScreen extends ConsumerStatefulWidget {
  const ThreeDayScreen({super.key});

  @override
  ConsumerState<ThreeDayScreen> createState() => _ThreeDayScreenState();
}

class _ThreeDayScreenState extends ConsumerState<ThreeDayScreen> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
  DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
  DateTime dayAfterTomorrow = DateTime.now().add(const Duration(days: 2));
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
                toolbarHeight: 68,
                centerTitle: false,
                leading: null,
                leadingWidth: 0,
                backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                title: Stack(
                  children: [
                    SizedBox(
                      height: 68,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(child: SizedBox(width: 6)),
                          const Expanded(child: SizedBox(width: 30)),
                          const Expanded(child: SizedBox(width: 6)),
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 18,
                              child: Text(
                                dateFormat.format(selectedDay),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox(width: 30)),
                          const SizedBox(width: 20),
                          const Expanded(child: SizedBox(width: 6)),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              dateFormat.format(tomorrow),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox(width: 30)),
                          const Expanded(child: SizedBox(width: 20)),
                          const Expanded(child: SizedBox(width: 6)),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              dateFormat.format(dayAfterTomorrow),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox(width: 30)),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 105,
                      child: Text(
                        dateFormat2.format(selectedDay).toUpperCase(),
                        style: const TextStyle(
                            fontSize: 13, color: Colors.blueAccent),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 221,
                      child: Text(
                        dateFormat2.format(tomorrow).toUpperCase(),
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 341,
                      child: Text(
                        dateFormat2.format(dayAfterTomorrow).toUpperCase(),
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: ThreeDayWidget(),
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
