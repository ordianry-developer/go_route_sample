import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    String? newTaskDescription;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 280,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      '운동 추가',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (newTitle) {
                      newTaskTitle = newTitle;
                    },
                    decoration: InputDecoration(
                      labelText: '운동명',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    autofocus: true,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (newDescription) {
                      newTaskDescription = newDescription;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    minLines: 2,
                    decoration: InputDecoration(
                      labelText: '설명',
                      border: InputBorder.none,
                      //floatingLabelStyle: const TextStyle(height: 4, color: Color.fromARGB(255, 160, 26, 179)),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    autofocus: true,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)),
              color: Colors.orange,
            ),
            height: 50,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(
                  newTaskTitle ?? '--',
                  newTaskDescription ?? '',
                );
                Navigator.pop(context);
              },
              child: Text(
                '추가',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
