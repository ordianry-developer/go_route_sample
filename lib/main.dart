import 'package:flutter/material.dart';
import 'constants.dart';
import 'models/task_data.dart';
import 'pages/error_page.dart';
import 'pages/settings_page.dart';
import 'pages/task_detail_page.dart';
import 'pages/task_list_page.dart';
import 'routes/app_router.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(TasksApp());
}

class TasksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TasksAppState();
}

class _TasksAppState extends State<TasksApp> {
  late TaskData taskData;

  @override
  void initState() {
    super.initState();
    taskData = TaskData();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => taskData),
      ],
      builder: (context,_){
        return MaterialApp.router(
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.orange.shade900,
            primarySwatch: white,
            scaffoldBackgroundColor: Color(0xfff8f8f8),
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: white,),
                foregroundColor: white,
                backgroundColor: Colors.orange.shade900,
                centerTitle: true
            ),
          ),
          title: '운동 Check List',
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
        );
      },
      
    );
  }
}
  