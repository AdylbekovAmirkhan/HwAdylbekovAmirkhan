import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson4/project/bloc/todoBloc.dart';
import 'package:lesson4/project/bloc/todoEvent.dart';
import 'package:lesson4/project/bloc/todoState.dart';


class TodoPage extends StatelessWidget {
  const TodoPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo")),
      body: Center(child: BlocBuilder<TodoBloc, TodoState>
      (
      builder: (context, state) {
          if (state is TodoErrorState) {
            return Text(state.errorText);
          }
          else if(state is TodoLoadingState) {
            return const CircularProgressIndicator();
          }
          else if (state is TodoLoadedState) {
            return Column(
              children: [
                Text(state.model.id.toString()),
                Text(state.model.todo),
                Text(state.model.completed.toString()),
                Text(state.model.userId.toString())
              ],
            );
          }
          else {
            return ElevatedButton(onPressed: () {
              context.read<TodoBloc>().add(GetEvent());
            }, child: const Text('Загрузитть'));
          }
        })),
    );
  }

  
}
