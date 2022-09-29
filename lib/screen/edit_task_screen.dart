import 'package:flutter/material.dart';
import 'package:tasks_bloc/services/guid_gen.dart';
import '../blocs/block_exports.dart';
import '../models/task.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({Key? key, required this.oldTask}) : super(key: key);

  final Task oldTask;

  @override
  Widget build(BuildContext context) {

    TextEditingController titleController = TextEditingController(text: oldTask.title);
    TextEditingController titleDescription = TextEditingController(text: oldTask.description);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Edit Task',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          TextField(
            autofocus: false,
            controller: titleDescription,
            minLines: 2,
            maxLines: 5,
            decoration: const InputDecoration(
              label: Text('Description'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  var editTask = Task(
                    title: titleController.text,
                    description: titleDescription.text,
                    id: oldTask.id,
                    isFavorite: oldTask.isFavorite,
                    isDone: oldTask.isDone,
                    date: DateTime.now().toString(),
                  );
                  context.read<TasksBloc>().add(EditTask(newTask: editTask, oldTask: oldTask));
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
