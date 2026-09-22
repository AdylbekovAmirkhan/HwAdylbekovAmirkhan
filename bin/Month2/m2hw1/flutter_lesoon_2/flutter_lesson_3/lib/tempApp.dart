import 'package:flutter/material.dart';

class TempApp extends StatefulWidget{
  @override
  State<TempApp> createState() => TempAppState();
}

class TempAppState extends State<TempApp>{
  int temp = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Cчетчик температуры'),
         centerTitle: true, titleTextStyle: TextStyle(color: Colors.white, fontSize: 32, fontFamily: 'monospace'),
          backgroundColor: Colors.black, shadowColor: Colors.black45,),
        backgroundColor: Colors.amberAccent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Температура', style: TextStyle(
                fontSize: 32
              ),
              ),
              SizedBox(height: 12,),
              Text('$temp градусов', style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: temp > 0 ? Colors.red : Colors.blue,
              ),
              ),

              SizedBox(height: 24,),

              Row(mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    temp--;
                  });
                }, 
                child: Text('Уменьшить')),

                SizedBox(width: 28,),

                ElevatedButton(onPressed: () {
                  setState(() {
                    temp++;
                  });
                }, 
                child: Text('Увеличить')),

                SizedBox(width: 28,),

                ElevatedButton(onPressed: () {
                  setState(() {
                    temp = 0;
                  });
                }, 
                child: Text('сброс'))
              ],
              )

            ],
          ),
        )
        
      )
    );
  }
}