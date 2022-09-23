import 'package:flutter/material.dart';
import 'package:tasks_bloc/widgets/tasks_list.dart';

import '../blocs/block_exports.dart';
import '../models/task.dart';

class FavoriteTaskScreen extends StatelessWidget {
  const FavoriteTaskScreen({Key? key}) : super(key: key);

  static const id = 'favorite_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.favoriteTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${taskList.length} Tasks',
                ),
              ),
            ),
            TasksList(tasksList: taskList),
          ],
        );
      },
    );
  }
}
