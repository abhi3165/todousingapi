import 'package:flutter/material.dart';
import 'package:todoapi/repository/todorepo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todoview extends ConsumerWidget {
  const Todoview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsyncValue = ref.watch(getpostprovider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: todosAsyncValue.when(
        data: (todos) {
          if (todos == null || todos.isEmpty) {
            return const Center(child: Text('No todos found.'));
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text('User ID: ${todo.userId}'),
                trailing: Icon(
                  todo.completed ? Icons.check : Icons.close,
                  color: todo.completed ? Colors.green : Colors.red,
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
