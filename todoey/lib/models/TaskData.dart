import 'package:flutter/foundation.dart';
import 'Task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(taskName: 'Bring Bread', isDone: false),
    Task(taskName: 'Bring Egg', isDone: false),
    Task(taskName: 'Bring Butter', isDone: false),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  /// Here we have added new task from Add task screen , But most imp is
  /// we have to call notifyListeners to notify the list value change at all
  /// places.

  void addTask(String title) {
    final task = Task(taskName: title);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
