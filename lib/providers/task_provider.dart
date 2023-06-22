import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/models/task.dart';

class TaskNotifier extends StateNotifier<Task> {
  TaskNotifier() : super(Task(title: '', date: DateTime.now(), isDone: false));
  void isDone() {
    state = Task(title: state.title, date: state.date, isDone: !state.isDone);
  }

  void addTask(String enteredText, DateTime date) {
    state = Task(title: enteredText, date: date, isDone: false);
  }
}

final taskProvider = StateNotifierProvider<TaskNotifier, Task>(
  (ref) => TaskNotifier(),
);
