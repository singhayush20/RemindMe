import 'package:flutter/material.dart';
import 'package:remindme/models/task_model.dart';
import '../widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:remindme/models/task_data.dart';

/// We don't need TaskList to be stateful anymore because
/// we are no longer passing the Task list via the TaskList constructor.
/// We can use the Provider in our package for this purpose.
class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*The BuildContext tells the children the location of
    the parent in the widget tree.
     */
    return Consumer<TaskData>(builder: (context, taskData, child) {
      //Now the consumer will listen to the changes and whenever there is a
      //change in the taskData, it will update the taskTitle, isChecked and taskDescp
      return ListView.builder(
        itemBuilder: (context, index) {
          Task currentTask = taskData.tasks[index];
          //do something
          return TaskTile(
              //widget refers to the stateful widget
              taskTitle: currentTask.taskName ?? '',
              isChecked: currentTask.isDone,
              taskDescp: currentTask.taskdescp ?? '',
              checkBoxCallback: (checkBoxState) {
                taskData.updateTask(currentTask);
              },
              longPressCallback: () {
                taskData.deleteTask(currentTask);
              });
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
