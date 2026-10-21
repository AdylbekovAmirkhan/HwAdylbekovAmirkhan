import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hw2/add/add_page.dart';
import 'package:hw2/add/settings_page.dart';
import 'package:hw2/database/app_database.dart';
import 'package:hw2/database/todo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  //выделить память для виджета
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool IsDark = false;
  // int _counter = 0;
  // bool isVisible = true;
  // List<Color> colors = [Colors.blue, Colors.red, Colors.yellow, Colors.green, Colors.black];
  // Color containerColor = Colors.black;
  // double width = 300;
  // double height = 100;

  List<Todo> _todoList = [];
  AppDatabase _appDatabase = AppDatabase();

  //виджет появляется в памяти со всеми данными, а также можно подгрузить данные
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //подгрузить данные из сети либо локального хранилища
    //запускать таймеры, анимации, контроллеры, стримы
    //иницилизировать свойства без значений
    print("Home Page - initState");
    _todoList = _appDatabase.getTodoList();
    print(_todoList[0]);
  }

  //рисует интерфейс
  @override
  Widget build(BuildContext context) {
    print("Home Page - build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: IsDark ? Color(0xFF1E1E2C) : Color(0xFFF5F5F7),
        title: Text(
          "Задачи",
          style: TextStyle(color: IsDark ? Colors.white : Colors.black),
        ),
      ),
      body: Center(
        child: Card(
          color: IsDark ? const Color(0xFF2D2D3F) : Color(0xFFF5F5F7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: IsDark ? 0 : 2,
          margin: EdgeInsets.symmetric(vertical: 6.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _todoList[index].title,
                    style: TextStyle(
                      color: IsDark ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      backgroundColor: IsDark ? Color(0xFF1E1E2C) : Color(0xFFF5F5F7),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddTap,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  //   @override
  // Widget build(BuildContext context) {
  //   print("Home Page - build");
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       title: Text(widget.title),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: .center,
  //         children: [
  //           Visibility(child:  Text("Additional info"), visible: isVisible),
  //           TextButton(onPressed: onHideTap, child: Text(isVisible ? "Скрыть" : "Показать")),
  //           Container(width: 300, height: 100, color: containerColor),
  //           TextButton(onPressed: onPaintTap, child: Text("Покрасить")),
  //           Container(width: width, height: height, color: Colors.pink),
  //           TextButton(onPressed: onSizeTap, child: Text("Поменять размер")),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // @override
  // void deactivate() {
  //   // TODO: implement deactivate
  //   super.deactivate();
  // }

  // void onHideTap() {
  //   setState(() {
  //     isVisible = !isVisible;
  //   });

  //   print(isVisible);
  // }

  // void onPaintTap() {
  //   setState(() {
  //     containerColor = colors[Random().nextInt(colors.length)];
  //   });
  // }

  // void onSizeTap() {
  //   setState(() {
  //     final w = Random().nextInt(300);
  //     final h = Random().nextInt(100);
  //     width = w.toDouble();
  //     height = h.toDouble();
  //   });
  // }

  void _onAddTap() async {
    final result = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => SettingsPage()));
    if (result != null) {
      setState(() {
        IsDark = result;
      });
    }
  }

  //высвобождает наш виджет из памяти
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //остановить фоновые процессы
    //stream, controller(ы), таймеры и анимации
    print("Home Page - dispose");
  }
}

extension on Random {
  void nextInt(int length) {}
}
