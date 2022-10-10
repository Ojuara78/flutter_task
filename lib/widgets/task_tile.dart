import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks_bloc/screen/edit_task_screen.dart';
import 'package:tasks_bloc/widgets/popup_menu.dart';
import '../blocs/block_exports.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    Navigator.of(context).pop();
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: EditTaskScreen(oldTask: task),
        ),
      ),
    );
  }

  void _likeOrDislikeTask(BuildContext context, Task task){
    Navigator.of(context).pop();
    context.read<TasksBloc>().add(MarkFavoriteOrUnfavoriteTask(task: task));
  }

  void _restoreTask(BuildContext context, Task task){
    Navigator.of(context).pop();
    context.read<TasksBloc>().add(RestoreTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavorite == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          decoration:
                          task.isDone! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      Text(
                        DateFormat('dd-MM-yyyy hh:mm').format(DateTime.parse(task.date)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false
                    ? (value) => context.read<TasksBloc>().add(UpdateTask(task: task))
                    : null,
              ),
              PopupMenu(
                task: task,
                cancelOrDeleteCallback: () => _removeOrDeleteTask(context, task),
                likeOrDislikeCallback: () => _likeOrDislikeTask(context, task),
                restoreTaskCallback: () => _restoreTask(context, task),
                editTaskCallback: () {
                  Navigator.of(context).pop();
                  _editTask(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ListTile(
// title: Text(
// task.title,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// decoration: task.isDone! ? TextDecoration.lineThrough : null,
// ),
// ),
// trailing: Checkbox(
// value: task.isDone,
// onChanged: task.isDeleted == false
// ? (value) {
// context.read<TasksBloc>().add(UpdateTask(task: task));
// }
// : null,
// ),
// onLongPress: () => _removeOrDeleteTask(context, task),
// );
