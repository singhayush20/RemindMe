import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final String taskDescp;
  final void Function(bool?) checkBoxCallback;
  final void Function() longPressCallback;
  TaskTile(
      {required this.isChecked,
      required this.taskDescp,
      required this.taskTitle,
      required this.checkBoxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        taskDescp,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.indigo[800],
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
      onLongPress: longPressCallback,
    );
  }
}
