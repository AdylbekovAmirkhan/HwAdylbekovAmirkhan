import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Image.asset('images/kedy.jpg'),
            Positioned(
              top: 10,
              right: 10,
              child: Text('SALE 50%'))
          ],
        )
      ),
    );
  }
}