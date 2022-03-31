import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String task;
  // final int index;
  final Function(bool?) checkBoxCallback;
  final Function() longPressCallback;

  TaskTile(
      {required this.task,
      required this.isChecked,
      // required this.index,
      required this.checkBoxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    /// deleting by index
    // final deleteTask = Provider.of<TaskData>(context);

    return ListTile(
      title: GestureDetector(
        /// deleting by index
        // onLongPress: () {
        // deleteTask.deleteTask(index: index);
        // },

        /// deleting by callback and object
        onLongPress: longPressCallback,
        child: Text(
          task,
          style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkBoxCallback,
      ),
    );
  }
}

// class TaskCheckbox extends StatelessWidget {
//   final bool checkBoxState;
//   final Function(bool?) toggleCheckboxState;
//   // final Function toggleCheckboxState;
//
//   TaskCheckbox(
//       {required this.checkBoxState, required this.toggleCheckboxState});
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: checkBoxState,
//       activeColor: Colors.lightBlueAccent,
//       onChanged: toggleCheckboxState,
//       // onChanged: toggleCheckboxState as void Function(bool?)?,
//     );
//   }
// }
