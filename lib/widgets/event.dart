import 'package:calendar_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isSwitched = false;

  Future<DateTime?> showCupertinoDatePicker(BuildContext context) async {
    DateTime? selectedDate;

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 300.0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime newDate) {
              selectedDate = newDate;
            },
          ),
        );
      },
    );

    return selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 250, 250, 250),
          leadingWidth: 100,
          leading: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const HomeScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 60,
                      ),
                      Expanded(
                        child: TextField(
                          autocorrect: false,
                          textCapitalization: TextCapitalization.sentences,
                          maxLines: null,
                          keyboardType: TextInputType.text,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Add title',
                            hintStyle: TextStyle(
                              fontSize: 30,
                              color: Colors.grey[700],
                            ),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 18,
                      ),
                      Icon(
                        Icons.access_time_outlined,
                        color: Colors.grey[700],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'All-day',
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 220.0),
                        child: CupertinoSwitch(
                          activeColor: Colors.blue[700],
                          value: isSwitched,
                          onChanged: (value) {
                            setState(
                              () {
                                isSwitched = value;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 45,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? pickedDate =
                                await showCupertinoDatePicker(context);

                            if (pickedDate != null) {
                              // Do something with the selected date
                            }
                          },
                          child: ListTile(
                            title: const Text(
                              'Wednesday, 14 Jun',
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: Visibility(
                              visible: !isSwitched,
                              child: GestureDetector(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 15.0),
                                  child: Text(
                                    '12:00',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 45,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? pickedDate =
                                await showCupertinoDatePicker(context);

                            if (pickedDate != null) {
                              // Do something with the selected date
                            }
                          },
                          child: ListTile(
                            title: const Text(
                              'Wednesday, 14 Jun',
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: Visibility(
                              visible: !isSwitched,
                              child: GestureDetector(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 15.0),
                                  child: Text(
                                    '13:00',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 45,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: ListTile(
                            title: Text(
                              'More options',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[700]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 1,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: const ListTile(
                            leading: CircleAvatar(
                              radius: 18,
                              child: Text(
                                'R',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            title: Row(
                              children: [
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: Colors.blue,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Events',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            subtitle: Text('rawjatum.sunya@gmail.com'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.group_outlined,
                      color: Colors.grey[700],
                    ),
                    title: Text(
                      'Add guests',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.videocam_outlined,
                      color: Colors.grey[700],
                    ),
                    title: Text(
                      'Add video conferencing',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey[700],
                    ),
                    title: Text(
                      'Add location',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.grey[700],
                    ),
                    title: const Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '30 minutes before',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      'Add another notification',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Container(
                      margin: const EdgeInsets.only(top: 3.5),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    title: Text(
                      'Default colors',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.density_medium_rounded,
                      color: Colors.grey[700],
                    ),
                    title: Text(
                      'Add description',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.attach_file_outlined,
                      color: Colors.grey[700],
                    ),
                    title: Text(
                      'Add attachment',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.lock_outline,
                      color: Colors.grey[700],
                    ),
                    title: Text(
                      ' Calendar default',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.work_outline,
                      color: Colors.grey[700],
                    ),
                    title: Text(
                      'Busy',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
