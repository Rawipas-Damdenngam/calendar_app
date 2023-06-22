import 'package:calendar_app/providers/task_provider.dart';
import 'package:calendar_app/widgets/day.dart';
import 'package:calendar_app/widgets/floating_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendar_app/widgets/calendar_drawer.dart';
import 'package:calendar_app/screens/search_screen.dart';
import 'package:calendar_app/screens/profile_screen.dart';
import 'package:calendar_app/screens/task_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/providers/account_provider.dart';
import 'package:calendar_app/widgets/calendar.dart';

class DayScreen extends ConsumerStatefulWidget {
  const DayScreen(
      {required this.enteredText, required this.selectedTime2, super.key});
  final String enteredText;
  final DateTime? selectedTime2;

  @override
  ConsumerState<DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends ConsumerState<DayScreen> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateFormat dateFormat = DateFormat('dd');
  DateFormat dateFormat2 = DateFormat('EEE');
  String? enteredText;
  DateTime? selectedTime2;

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
    ref.watch(taskProvider);
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
                toolbarHeight: 64,
                centerTitle: false,
                leading: null,
                leadingWidth: 0,
                backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                title: Stack(
                  children: [
                    SizedBox(
                      height: 64,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 6),
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 18,
                            child: Text(
                              dateFormat.format(selectedDay),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Container(
                            width: 1,
                            height: 70,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(width: 7),
                          Expanded(
                            child: Visibility(
                              visible: widget.enteredText.isNotEmpty,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) => TaskScreen(
                                          enteredText:
                                              ref.read(taskProvider).title,
                                          selectedTime2:
                                              ref.read(taskProvider).date)),
                                    ),
                                  );
                                },
                                child: Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[600],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: ref.read(taskProvider).isDone
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                  color: Colors.blue[600],
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ))
                                              : const SizedBox.shrink(),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.0),
                                                child: Icon(
                                                    size: 20,
                                                    Icons.check_circle_outline),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  ref
                                                          .read(taskProvider)
                                                          .title
                                                          .isNotEmpty
                                                      ? ref
                                                          .read(taskProvider)
                                                          .title
                                                      : 'Nothing Planned',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    decoration: ref
                                                            .read(taskProvider)
                                                            .isDone
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : null,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 11,
                      child: Text(
                        dateFormat2.format(selectedDay).toUpperCase(),
                        style: const TextStyle(
                            fontSize: 12, color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DayWidget(
                  enteredText: widget.enteredText,
                  selectedTime2: widget.selectedTime2!,
                ),
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
