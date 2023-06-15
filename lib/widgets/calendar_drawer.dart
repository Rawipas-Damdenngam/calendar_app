import 'package:calendar_app/screens/home_screen.dart';
import 'package:calendar_app/widgets/calendar_month.dart';
import 'package:flutter/material.dart';
import 'package:calendar_app/screens/day_screen.dart';

class CalendarDrawer extends StatefulWidget {
  const CalendarDrawer({super.key});

  @override
  State<CalendarDrawer> createState() => _CalendarDrawerState();
}

class _CalendarDrawerState extends State<CalendarDrawer> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool showMore = false;

  void checkedBox1(bool? value) {
    setState(() {
      isChecked1 = value!;
    });
  }

  void checkedBox2(bool? value) {
    setState(() {
      isChecked2 = value!;
    });
  }

  void checkedBox3(bool? value) {
    setState(() {
      isChecked3 = value!;
    });
  }

  void checkedBox4(bool? value) {
    setState(() {
      isChecked4 = value!;
    });
  }

  void checkedBox5(bool? value) {
    setState(() {
      isChecked5 = value!;
    });
  }

  void checkedBox6(bool? value) {
    setState(() {
      isChecked6 = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    // int visibleCount = showMore ? checkboxList.length : 5;

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.5),
                  child: Image.asset(
                    'assets/images/google.jpeg',
                    width: 100,
                    height: 35,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.0, top: 15.5),
                  child: Text(
                    'Calendar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 96, 100, 104),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 30,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(
                Icons.schedule_outlined,
              ),
              title: const Text(
                'Schedule',
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const HomeScreen()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(
                Icons.calendar_view_day,
              ),
              title: const Text(
                'Day',
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const Day()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(
                Icons.calendar_view_day_rounded,
              ),
              title: const Text(
                '3Day',
              ),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(
                Icons.calendar_view_week_outlined,
              ),
              title: const Text(
                'Week',
              ),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(
                Icons.calendar_view_month_outlined,
              ),
              title: const Text(
                'Month',
              ),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          const Divider(
            height: 15,
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  'R',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              title: Text(
                'RAWJATUM.SUNYA@GMAIL.COM',
                style: TextStyle(fontSize: 11),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: ListTile(
              onTap: () {
                setState(() {
                  isChecked1 = !isChecked1;
                });
              },
              leading: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.lightBlue,
                fillColor: MaterialStateProperty.all(Colors.lightBlue),
                value: isChecked1,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked1 = value!;
                  });
                },
              ),
              title: const Text('Events'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: ListTile(
              onTap: () {
                setState(() {
                  isChecked2 = !isChecked2;
                });
              },
              leading: Checkbox(
                activeColor: Colors.blue,
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.all(Colors.blue),
                value: isChecked2,
                onChanged: checkedBox2,
              ),
              title: const Text('Tasks'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  'E',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              title: Text(
                'EIEI.EUEU@GMAIL.COM',
                style: TextStyle(fontSize: 11),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: ListTile(
              onTap: () {
                setState(() {
                  isChecked3 = !isChecked3;
                });
              },
              leading: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.lightBlue,
                fillColor: MaterialStateProperty.all(Colors.blue),
                value: isChecked3,
                onChanged: checkedBox3,
              ),
              title: const Text('Events'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: ListTile(
              onTap: () {
                setState(() {
                  isChecked4 = !isChecked4;
                });
              },
              leading: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.blue,
                fillColor: MaterialStateProperty.all(Colors.blue),
                value: isChecked4,
                onChanged: checkedBox4,
              ),
              title: const Text('Tasks'),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 15.0),
          //   child: ListView.builder(
          //     itemCount: visibleCount,
          //     itemBuilder: (context, index) {
          //       return CheckboxListTile(
          //         title: Text(checkboxList[index].label),
          //         value: checkboxList[index].isChecked,
          //         onChanged: (value) {
          //           setState(() {
          //             checkboxList[index].isChecked = value!;
          //           });
          //         },
          //       );
          //     },
          //   ),
          // ),
          Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showMore = !showMore;
                  });
                },
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        onTap: () {},
                        title: const Text(
                          'Show more',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          const Divider(
            indent: 85,
            height: 20,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: ListTile(
              onTap: () {
                setState(() {
                  isChecked5 = !isChecked5;
                });
              },
              leading: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.lightGreen,
                fillColor: MaterialStateProperty.all(Colors.lightGreen),
                value: isChecked5,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked5 = value!;
                  });
                },
              ),
              title: const Text('Birthdays'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: ListTile(
              onTap: () {
                setState(() {
                  isChecked6 = !isChecked6;
                });
              },
              leading: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.green,
                fillColor: MaterialStateProperty.all(Colors.green),
                value: isChecked6,
                onChanged: checkedBox6,
              ),
              title: const Text('Holidays'),
            ),
          ),
          const Divider(
            indent: 85,
            height: 15,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.feedback_outlined),
              title: const Text('Send feedback'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help'),
              onTap: () {
                // Handle inbox tap
              },
            ),
          ),
        ],
      ),
    );
  }
}
