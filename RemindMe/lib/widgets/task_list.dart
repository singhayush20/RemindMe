import 'package:flutter/material.dart';
import '../widgets/task_tile.dart';
import '../models/task_model.dart';

class TaskList extends StatefulWidget {
  late final List<Task> tasks;
  TaskList({required this.tasks});
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    /*The BuildContext tells the children the location of
    the parent in the widget tree.
     */
    return ListView.builder(
      itemBuilder: (context, index) {
        //do something
        return TaskTile(
            //widget refers to the stateful widget
            taskTitle: widget.tasks[index].taskName ?? '',
            isChecked: widget.tasks[index].isDone,
            taskDescp: widget.tasks[index].taskdescp ?? '',
            checkBoxCallback: (checkBoxState) {
              setState(
                () {
                  widget.tasks[index]
                      .toggleDone(); //changes the isDone property
                },
              );
            });
      },
      itemCount: widget.tasks.length,
    );
    // ListView(
    //   children: [
    //     TaskTile(
    //       isChecked: tasks[0].isDone,
    //       taskDescp: tasks[0].taskdescp ?? '',
    //       taskTitle: tasks[0].taskName ?? '',
    //     ),
    //     TaskTile(
    //       isChecked: tasks[1].isDone,
    //       taskDescp: tasks[1].taskdescp ?? '',
    //       taskTitle: tasks[1].taskName ?? '',
    //     ),
    //     TaskTile(
    //       isChecked: tasks[2].isDone,
    //       taskDescp: tasks[2].taskdescp ?? '',
    //       taskTitle: tasks[2].taskName ?? '',
    //     ),
    //   ],
    // );
  }
}
