import 'package:calendar_app/screens/day_screen.dart';
import 'package:calendar_app/providers/task_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Task extends ConsumerStatefulWidget {
  final String enteredText;

  const Task({super.key, required this.enteredText});

  @override
  ConsumerState<Task> createState() => _TaskState();
}

class _TaskState extends ConsumerState<Task> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedTime = DateTime.now();
  final DateFormat timeFormat = DateFormat('HH:mm');

  final DateFormat dateFormat = DateFormat('EEEE, d MMM');
  bool isSwitched = true;
  TextEditingController textFieldController = TextEditingController();

  Future<DateTime?> pickDate(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 300.0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime newDate) {
              setState(
                () {
                  selectedDate = newDate;
                },
              );
            },
          ),
        );
      },
    );
    return selectedDate;
  }

  Future<void> pickTime() async {
    final DateTime? pickedTime = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300.0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: selectedTime,
            onDateTimeChanged: (DateTime newTime) {
              setState(
                () {
                  selectedTime = newTime;
                },
              );
            },
          ),
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void saveTask() {
    final String enteredText = textFieldController.text;
    ref.watch(taskProvider.notifier).addTask(enteredText, selectedTime);

    Navigator.of(context).pop(enteredText);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(taskProvider);
    return FractionallySizedBox(
      heightFactor: 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            centerTitle: false,
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 250, 250, 250),
            leadingWidth: 100,
            toolbarHeight: 100,
            leading: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 50),
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
                    saveTask();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => DayScreen(
                          enteredText: textFieldController.text,
                          selectedTime2: selectedTime,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 50),
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
                          //maxLength: 20,
                          controller: textFieldController,
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
                                  'Tasks',
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
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.filter_list_outlined,
                      color: Colors.grey[700],
                    ),
                    title: Text(
                      'Add details',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
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
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 45,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? pickedDate = await pickDate(context);

                            if (pickedDate != null) {
                              // Do something with the selected date
                            }
                          },
                          child: ListTile(
                            title: Text(
                              dateFormat.format(selectedDate.toLocal()),
                              style: const TextStyle(fontSize: 18),
                            ),
                            trailing: Visibility(
                              visible: !isSwitched,
                              child: GestureDetector(
                                onTap: () async {
                                  await pickTime();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Text(
                                    timeFormat.format(selectedTime),
                                    style: const TextStyle(fontSize: 18),
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
                        width: 20,
                      ),
                      Icon(Icons.replay_outlined, color: Colors.grey[700]),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: const ListTile(
                            title: Text(
                              'Does not repeat',
                              style: TextStyle(fontSize: 18),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
