import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  int get taskCount {
    return _tasks.length;
  }

  //  now I can't change task directly, it will throw error, so good for preventing future errors
  UnmodifiableListView<Task> get getTasksList {
    return UnmodifiableListView(_tasks);
  }

  void addTask({newTask}) {
    _tasks.add(Task(task: newTask));
    notifyListeners();
  }

  void toggleCheckbox({index}) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  /// deleting by index
  // void deleteTask({index}) {
  //   _tasks.removeAt(index);
  //   notifyListeners();
  // }

  void deleteTask({required Task task}) {
    _tasks.remove(task);
    notifyListeners();
  }
}
