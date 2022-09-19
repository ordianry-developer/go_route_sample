
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class TaskCheckbox extends StatelessWidget {
  final Task task;
  TaskCheckbox({required this.task});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: BorderSide(
        color: Colors.orange,
      ),
      activeColor: Colors.orange,
      value: task.isDone,
      shape: CircleBorder(),
      onChanged: (bool? value) {
        context.read<TaskData>().updateTask(task);
      },
    );
  }
}
