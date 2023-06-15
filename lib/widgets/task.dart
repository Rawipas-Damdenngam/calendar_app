import 'package:calendar_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const HomeScreen(),
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
                  SizedBox(
                    height: 5,
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
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.replay_outlined, color: Colors.grey[700]),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: ListTile(
                            title: const Text(
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
