import 'package:flutter/material.dart';

class Task {
  String? taskName;
  String? taskdescp;
  bool isDone;
  Task({this.taskName, this.isDone = false, this.taskdescp});
  void toggleDone() {
    isDone = !isDone;
  }
}
