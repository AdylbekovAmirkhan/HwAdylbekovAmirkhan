import 'package:flutter/material.dart';

class Tabviewapp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: DefaultTabController(length: 3, child: Scaffold(
        appBar: AppBar(
          title: Text('приложение'),
          bottom: TabBar(tabs: [
            Tab(text: 'News',),
            Tab(text: 'Chats',),
            Tab(text: 'Profile'),
          ]),
        ),
      )),
    );
  }
}

