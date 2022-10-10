import 'package:flutter/material.dart';
import '../models/task.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    Key? key,
    required this.task,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
  }) : super(key: key);

  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: editTaskCallback,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: likeOrDislikeCallback,
                      icon: task.isFavorite == false
                          ? const Icon(Icons.bookmark_add_outlined)
                          : const Icon(Icons.bookmark_remove),
                      label: task.isFavorite == false
                          ? const Text('Add to \nBookmarks')
                          : const Text('Remove from \nBookmarks'),
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: cancelOrDeleteCallback,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                    ),
                  ),
                ])
            : (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: restoreTaskCallback,
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text('Restore'),
                    ),
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: cancelOrDeleteCallback,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete Forever'),
                    ),
                  ),
                ]);
  }
}
