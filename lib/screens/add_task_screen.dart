import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  // final Function newTaskCallback;
  String task = "";

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              onChanged: (value) {
                task = value;
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              // onPressed: newTaskCallback(task),
              onPressed: () {
                final addTask = Provider.of<TaskData>(context, listen: false);
                addTask.addTask(newTask: task);
                Navigator.pop(context);
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// uplifting state callback
// --------------------------------------------------------------
//
// import 'package:flutter/material.dart';
//
// class AddTaskScreen extends StatelessWidget {
//   final Function newTaskCallback;
//   String task = "";
//
//   AddTaskScreen({required this.newTaskCallback});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xff757575),
//       child: Container(
//         padding: const EdgeInsets.all(30.0),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(20.0),
//             topLeft: Radius.circular(20.0),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             const Text(
//               "Add Task",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 30.0,
//                 color: Colors.lightBlueAccent,
//               ),
//             ),
//             TextField(
//               autofocus: true,
//               onChanged: (value) {
//                 task = value;
//               },
//             ),
//             const SizedBox(
//               height: 15.0,
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.lightBlueAccent,
//               ),
//               onPressed: () {
//                 newTaskCallback(task);
//               },
//               child: const Text(
//                 "Add",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
