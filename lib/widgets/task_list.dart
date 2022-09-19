
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}
class _TaskListState extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.orange[900],
            child: TaskTile(
              task:taskData.tasks[index]
            ),
          );
        },
        itemCount:taskData.taskCount,
      );
    });

  }}


