import 'dart:math';
import 'package:flutter/material.dart';
import '/add/add_page.dart';
import '/database/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/home/home_cubit.dart';
import '/home/home_state.dart';
import '/settings/settings_cubit.dart';
import '/settings/settings_page.dart';
import 'package:hw5/detailPage/todoDetailCubit.dart';
import 'package:hw5/detailPage/todoDetailPage.dart';

class MyHomePage extends StatefulWidget {
  final HomeCubit cubit;
  final Function(bool) onThemeChanged;

  const MyHomePage({super.key, required this.title, required this.cubit, required this.onThemeChanged});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = widget.cubit;
    cubit.getTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [IconButton(onPressed: _onSettingsTap, icon: const Icon(Icons.settings))],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.empty) {
            return const Center(child: Text("У вас еще нет задач"));
          } else if (state.status == HomeStatus.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == HomeStatus.error) {
            return const Center(child: Icon(Icons.error));
          } else {
            return Center(
              child: ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  final todo = state.todoList[index];
                  return ListTile(
                    title: Text(todo.title),
                    onTap: () => _onTodoTap(todo),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddTap,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onAddTap() async {
    final result = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => AddPage()));
    cubit.getTodoList();
    if (result != null) {
      print("$result");
    }
  }

  void _onSettingsTap() {
    final settingsCubit = SettingsCubit();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => settingsCubit, 
          child: SettingsPage(onThemeChanged: widget.onThemeChanged)
        )
      )
    );
  }

  void _onTodoTap(Todo todo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => TodoDetailCubit(todo: todo),
          child: const TodoDetailPage(),
        ),
      ),
    ).then((_) {
      cubit.getTodoList();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

extension on Random {
  void nextInt(int length) {}
}
