import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_cubit.dart';
import 'home_state.dart';
import 'todo_details_page.dart';
import '../settings/settings_page.dart';
import '../add/add_page.dart';

class MyHomePage extends StatefulWidget {
  final HomeCubit cubit;
  final Function(bool) onThemeChanged;
  final String title;

  const MyHomePage({
    super.key, 
    required this.title, 
    required this.cubit, 
    required this.onThemeChanged,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    print("Home Page - initState");
    cubit = widget.cubit;
    cubit.getTodoList();
  }

  @override
  Widget build(BuildContext context) {
    print("Home Page - build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: _onSettingsTap, 
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.empty) {
            return const Center(child: Text("У вас еще нет задач"));
          } else if (state.status == HomeStatus.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                final item = state.todoList[index];
                return ListTile(
                  title: Text(item.title),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => TodoDetailsPage(todo: item),
                      ),
                    );
                  },
                );
              },
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
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AddPage()),
    );
    if (result != null) {
      print("$result");
    }
  }

  void _onSettingsTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SettingsPage(onThemeChanged: widget.onThemeChanged),
      ),
    );
  }
}
