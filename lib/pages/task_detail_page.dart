import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/task_data.dart';
import '../widgets/task_list.dart';
import '../widgets/add_task_dialog.dart';

class TaskDetailPage extends StatefulWidget {
  static const routeName = 'task_detail_page';
  final String taskId;

  const TaskDetailPage({super.key, required this.taskId});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  late Task? task;
  @override
  void initState() {
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    print(widget.taskId);
    task = context.read<TaskData>().tasks[int.parse(widget.taskId)];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '운동 상세 내용',
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/runningbackground.jpeg'),
            onError: (error, stackTrace) => print(error),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '운동 ID: ${task?.id} ',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '운동 명: ${task?.name} ',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "운동 설명: ${task?.detail ?? '운동에 대한 가이드가 없습니다.'} ",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('확인'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
