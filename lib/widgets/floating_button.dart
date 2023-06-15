import 'package:flutter/material.dart';
import 'package:calendar_app/widgets/event.dart';
import 'package:calendar_app/widgets/task.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                    color: const Color.fromARGB(255, 250, 250, 250),
                    margin:
                        const EdgeInsets.only(top: 650, left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
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
                                      backgroundColor: Colors.white,
                                      radius: 25,
                                      child: Icon(
                                        Icons.free_cancellation_outlined,
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
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
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
                                      backgroundColor: Colors.white,
                                      radius: 25,
                                      child: Icon(Icons.location_on_outlined,
                                          color: Colors.blueAccent),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
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
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (ctx) => const Task());
                                    },
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 25,
                                      child: Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: Colors.blueAccent),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                      builder: (ctx) => const Event());
                                },
                                child: const CircleAvatar(
                                  radius: 30,
                                  child: Icon(Icons.calendar_today_rounded),
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
    );
  }
}
