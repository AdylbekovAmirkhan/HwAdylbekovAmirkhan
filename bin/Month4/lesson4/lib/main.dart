import 'package:flutter/material.dart';
import 'package:lesson4/project/todoPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson4/project/bloc/todoBloc.dart';
import 'package:lesson4/project/bloc/todoEvent.dart';
import 'package:lesson4/project/bloc/todoState.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TodoBloc(),
        child: const TodoPage(),
      ),
    );
  }
}