import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendar_app/providers/task_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/widgets/task.dart';

class TaskScreen extends ConsumerStatefulWidget {
  final String enteredText;
  final DateTime selectedTime2;

  const TaskScreen(
      {super.key, required this.enteredText, required this.selectedTime2});

  @override
  ConsumerState<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends ConsumerState<TaskScreen> {
  final DateFormat timeFormat = DateFormat('EEEE, d MMM HH:mm');

  void _onclickMark() {
    setState(() {
      ref.read(taskProvider.notifier).isDone();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => Task(
                          enteredText: ref.read(taskProvider).title,
                        )));
              },
              child: const Icon(
                Icons.mode_edit_outline_outlined,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.more_horiz_outlined,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 70.0,
                ),
                child: Text(
                  'My work',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: RichText(
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.enteredText}\n',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          decoration: ref.read(taskProvider).isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: DateFormat('EEEE, d MMM HH:mm')
                            .format(widget.selectedTime2),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.calendar_today_outlined),
              ),
              SizedBox(width: 15),
              Text(
                'rawjatum.sunya@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 300.0, bottom: 30),
        child: GestureDetector(
          onTap: () {
            _onclickMark();
          },
          child: Text(
            ref.watch(taskProvider).isDone
                ? 'Mark incomplete'
                : 'Mark complete',
            style: TextStyle(
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
