import 'package:flutter/material.dart';
import '../blocs/block_exports.dart';
import '../widgets/tasks_list.dart';
import 'drawer_task_screen.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({Key? key}) : super(key: key);

  static const id = 'reciclebin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recicle Bin'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                   child: TextButton.icon(
                     onPressed: null,
                     icon: const Icon(Icons.delete_forever),
                     label: const Text('Delete all tasks'),
                   ),
                    onTap: () => context.read<TasksBloc>().add(DeleteAllTasks()),
                  ),
                ]
              ),
            ],
          ),
          drawer: DrawerTaskScreen(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.removedTasks.length} Tasks',
                  ),
                ),
              ),
              TasksList(tasksList: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}
