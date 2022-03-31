import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

import 'task_tile.dart';

class TasksList extends StatelessWidget {
  // List<Task> tasks = [];
  //
  // @override
  // void initState() {
  //   tasks = widget.tasks;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final taskObject = taskData.getTasksList[index];
            return TaskTile(
              // task: Provider.of<TaskData>(context).tasks[index].task,
              // isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
              task: taskObject.task,
              isChecked: taskObject.isDone,

              /// deleting by index
              // index: index,
              checkBoxCallback: (bool? value) {
                /// one way
                // final toggleCheckbox =
                //     Provider.of<TaskData>(context, listen: false);
                // toggleCheckbox.toggleCheckbox(index: index);

                /// second way
                taskData.toggleCheckbox(index: index);
              },
              longPressCallback: () {
                taskData.deleteTask(task: taskObject);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

// state uplifting
// ------------------------------------------------------------------
//
// import 'package:flutter/material.dart';
// import 'package:todo_flutter/models/task.dart';
//
// import 'task_tile.dart';
//
// class TasksList extends StatefulWidget {
//   final List<Task> tasks;
//   TasksList({required this.tasks});
//
//   @override
//   State<TasksList> createState() => _TasksListState();
// }
//
// class _TasksListState extends State<TasksList> {
//   List<Task> tasks = [];
//
//   @override
//   void initState() {
//     tasks = widget.tasks;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return TaskTile(
//           task: tasks[index].task,
//           isChecked: tasks[index].isDone,
//           checkBoxCallback: (bool? value) {
//             setState(() {
//               tasks[index].toggleDone();
//               // tasks[index].isDone = value!;
//             });
//           },
//         );
//       },
//       itemCount: tasks.length,
//     );
//   }
// }
