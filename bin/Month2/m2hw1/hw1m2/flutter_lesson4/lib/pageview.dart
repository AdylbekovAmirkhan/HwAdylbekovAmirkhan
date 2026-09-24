import 'package:flutter/material.dart';

class PageViewApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Page view'),),
        body: PageView(
          children: [page('Welcome', Colors.blue),
          page('flutter', Colors.green), page('dev', Colors.orange)],
        )
      ),
    );
  }

Widget page(String text, Color color) {
  return Container(
    color: color,
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
}
