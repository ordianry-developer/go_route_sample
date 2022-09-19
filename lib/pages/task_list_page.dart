import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/task_data.dart';
import '../widgets/task_list.dart';
import '../widgets/add_task_dialog.dart';
import 'settings_page.dart';

class TaskListPage extends StatefulWidget {
  static const routeName = 'task_list_page';
  final List<Task>? tasks;
  final ValueChanged<Task>? onTapped;

  const TaskListPage({super.key, this.tasks, this.onTapped});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  Widget buildBottomSheet(BuildContext context) {
    return AddTaskScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu_outlined),
          onPressed: () {
            //Navigator.pushNamed(context, SettingsPage.routeName);
            GoRouter.of(context).go('/${SettingsPage.routeName}');
          },
        ),
        title: Text('운동 List (${Provider.of<TaskData>(context).taskCount}개)'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/runningbackground.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 00.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t be lazy!!',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: TaskList(),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[900],
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: AddTaskScreen(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
