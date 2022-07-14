import 'package:flutter/foundation.dart';
import '../models/task_model.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(taskName: 'Task 1', taskdescp: 'Descp 1'),
    Task(taskName: 'Task 2', taskdescp: 'Descp 2'),
    Task(taskName: 'Task 3', taskdescp: 'Descp 3')
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  //get means that this is a getter method
  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTitle, String newDescp, bool newIsDone) {
    final task =
        Task(taskName: newTitle, taskdescp: newDescp, isDone: newIsDone);
    _tasks.add(task);
    notifyListeners(); //notify all the widgets
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners(); //to update the widgets
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
