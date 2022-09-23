import 'package:flutter/material.dart';
import 'package:tasks_bloc/widgets/tasks_list.dart';

import '../blocs/block_exports.dart';
import '../models/task.dart';

class PendingTaskScreen extends StatelessWidget {
  const PendingTaskScreen({Key? key}) : super(key: key);

  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${taskList.length} Pending | ${state.completedTasks.length} Completed',
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
