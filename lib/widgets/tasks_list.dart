import 'package:flutter/material.dart';
import 'package:tasks_bloc/blocs/block_exports.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key, required this.tasksList}) : super(key: key);

  final List<Task> tasksList;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          var task = tasksList[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                  decoration: task.isDone! ? TextDecoration.lineThrough : null),
            ),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: task.isDeleted == false
                  ? (value) {
                      context.read<TasksBloc>().add(UpdateTask(task: task));
                    }
                  : null,
            ),
            onLongPress: () => _removeOrDeleteTask(context, task),
          );
        },
      ),
    );
  }
}
