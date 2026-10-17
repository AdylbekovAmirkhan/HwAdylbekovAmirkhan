import 'package:flutter/material.dart';
import 'package:hw1/add/addPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  //выделить память для виджета
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List tasks = [];

  void _incrementCounter() {
    //setState(() {
    //_counter++;
    //});
    _counter++;
    print("$_counter");
  }

  //виджет появляется в памяти со всеми данными, а также можно подгрузить данные
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //подгрузить данные из сети либо локального хранилища
    //запускать таймеры, анимации, контроллеры, стримы
    //иницилизировать свойства без значений
    print("Home Page - initState");
  }

  //рисует интерфейс
  @override
  Widget build(BuildContext context) {
    print("Home Page - build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Text(
              'Задачи',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: tasks.isEmpty
                ? Center(child: Text('у вас пока нет задач'))
                : ListView.builder(
                    itemBuilder: ((context, index) =>
                        ListTile(title: Text(tasks[index]))),
                    itemCount: tasks.length,
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddTap,
        tooltip: 'New',
        child: const Icon(Icons.add),
      ),
    );
  }

  // @override
  // void deactivate() {
  //   // TODO: implement deactivate
  //   super.deactivate();
  // }

  void _onAddTap() async {
    final String? result = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => AddPage()));
    if (result != null && result.isNotEmpty) {
      setState(() {
        tasks.insert(0, result);
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
