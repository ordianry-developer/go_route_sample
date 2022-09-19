
import 'package:flutter/material.dart';

import 'task.dart';
class TaskData extends ChangeNotifier {

  final List<Task> _tasks = [
    Task(name: '스쿼트하기',id:0,detail: '무게중심이 너무 앞으로 오지 않게 하세요. 엉덩이가 무릎 아래까지 내려오도록 앉았다 일어나세요.'),
    Task(name: '런닝머신 달리기',id:1,detail:'발을 11자를 유지하고 무릎을 높이 들어올려 달리세요.'),
    Task(name: '턱걸이하기',id:2,detail:'반동을 주지 않고 팔을 당기세요. 내려올때 힘을 한번에 풀지말고 천천히 내려오세요.'),
  ];

  List<Task> get tasks{
    return _tasks;
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTaskTitle,String newTaskDescription){
    final task = Task(name: newTaskTitle,detail: newTaskDescription,id:taskCount);

    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}
