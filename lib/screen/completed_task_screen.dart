import 'package:flutter/material.dart';
import 'package:tasks_bloc/widgets/tasks_list.dart';

import '../blocs/block_exports.dart';
import '../models/task.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  static const id = 'completed_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.completedTasks;
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
