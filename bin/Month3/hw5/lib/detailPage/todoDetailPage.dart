import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw5/detailPage/todoDetailCubit.dart';
import 'package:hw5/detailPage/todoDetailState.dart';

class TodoDetailPage extends StatefulWidget {
  const TodoDetailPage({super.key});

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  late final TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    final initialTodo = context.read<TodoDetailCubit>().state.todo;
    _titleController = TextEditingController(text: initialTodo.title);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoDetailCubit, TodoDetailState>(
      listener: (context, state) {
        if (state.status == TodoDetailStatus.success) {
          Navigator.of(context).pop();
        }
        if (state.status == TodoDetailStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Произошла ошибка')),
          );
        }
      },
      child: BlocBuilder<TodoDetailCubit, TodoDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Детали задачи'),
              actions: [
                if (state.status != TodoDetailStatus.loading)
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<TodoDetailCubit>().deleteTodo();
                    },
                  ),
              ],
            ),
            body: state.status == TodoDetailStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            labelText: 'Название задачи',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<TodoDetailCubit>()
                                  .updateTodo(_titleController.text);
                            },
                            child: const Text('Сохранить'),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
