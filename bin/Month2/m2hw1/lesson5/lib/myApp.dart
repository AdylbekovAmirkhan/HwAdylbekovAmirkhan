import 'package:flutter/material.dart';

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page'),),
      body: Center(
        child: ElevatedButton
        (onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
         child: Text('Перейти на второй экран')),
      ),
    );
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('second Page'),),
      body: Center(
        child: ElevatedButton
        (onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage()));
        },
         child: Text('Перейти на третий экран')),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('third Page'),),
      body: Center(
        child: ElevatedButton
        (onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
         child: Text('На главную')),
      ),
    );
  }
}