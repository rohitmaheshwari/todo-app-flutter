import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:todo_flutter/screens/add_task_screen.dart';
import 'package:todo_flutter/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  // bool isChecked = false;
  // List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 30.0, left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Todo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "${Provider.of<TaskData>(context).taskCount} tasks",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 35.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// state uplifting
// --------------------------------------------------------------
//
// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_flutter/models/task.dart';
// import 'package:todo_flutter/screens/add_task_screen.dart';
// import 'package:todo_flutter/widgets/tasks_list.dart';
//
// class TasksScreen extends StatefulWidget {
//   final task;
//
//   TasksScreen({this.task});
//
//   @override
//   State<TasksScreen> createState() => _TasksScreenState();
// }
//
// class _TasksScreenState extends State<TasksScreen> {
//   // bool isChecked = false;
//
//   List<Task> tasks = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//             isScrollControlled: true,
//             context: context,
//             builder: (context) {
//               return SingleChildScrollView(
//                 child: Container(
//                   padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).viewInsets.bottom),
//                   child: AddTaskScreen(
//                     newTaskCallback: (String newTask) {
//                       setState(() {
//                         tasks.add(Task(task: newTask));
//                       });
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//         backgroundColor: Colors.lightBlueAccent,
//         child: const Icon(
//           Icons.add,
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.only(
//                   top: 20.0, bottom: 30.0, left: 30.0, right: 30.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   const CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 30.0,
//                     child: Icon(
//                       Icons.list,
//                       size: 30.0,
//                       color: Colors.lightBlueAccent,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10.0,
//                   ),
//                   const Text(
//                     "Todo",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 50.0,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Text(
//                     "${tasks.length} tasks",
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding:
//                 const EdgeInsets.only(left: 20.0, right: 20.0, top: 35.0),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20.0),
//                     topRight: Radius.circular(20.0),
//                   ),
//                 ),
//                 child: TasksList(
//                   tasks: tasks,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
