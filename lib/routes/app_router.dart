import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import '../pages/error_page.dart';
import '../pages/settings_page.dart';
import '../pages/task_detail_page.dart';
import '../pages/task_list_page.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return TaskListPage();
        },
        routes: [
          GoRoute(
            path: SettingsPage.routeName,
            builder: (BuildContext context, GoRouterState state) {
              return SettingsPage();
            },
          ),
          GoRoute(
            path: '${TaskDetailPage.routeName}/:taskId',
            builder: (BuildContext context, GoRouterState state) {
              //final taskId=int.parse(state.queryParams['taskId']??'-1');
              final taskId = int.parse(state.params['taskId'] ?? '-1');
              if (taskId < 0 || taskId > context.read<TaskData>().taskCount - 1) {
                throw Exception('taskId not found: $taskId');
              }
              return TaskDetailPage(taskId: taskId.toString());
            },
          ),
        ],
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) => ErrorPage(
      message: state.error.toString(),
    ),
    urlPathStrategy: UrlPathStrategy.path, // web 브라우저에 자동으로붙는 # 문자를 제거한다.
    debugLogDiagnostics: true, // route debug정보를 console에 출력한다.
  );

  static GoRouter get router => _router;
}
