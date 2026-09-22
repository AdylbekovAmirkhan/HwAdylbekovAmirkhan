import 'package:flutter/material.dart';

class CalcApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalcScreen(),
    );
  }
}

class CalcScreen extends StatefulWidget{
  @override
  State<CalcScreen> createState() => CalcScreenState();
}

class CalcScreenState extends State<CalcScreen>{
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  double result = 0;

  double get firstValue => double.tryParse(firstController.text)?? 0;
  double get secondtValue => double.tryParse(secondController.text)?? 0;

  void resetCalc(){
    setState(() {
      firstController.clear();
      secondController.clear();
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 198, 200, 240),
      appBar: AppBar(title: Text('Calculator simple'),
      backgroundColor: const Color.fromARGB(255, 124, 126, 175),),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: firstController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Первое число',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 16,),

          TextField(
            controller: secondController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Второе число',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 26),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue),
               elevation: WidgetStatePropertyAll(12), shadowColor: WidgetStatePropertyAll(Colors.black54)),onPressed: () {
                setState(() {
                  result = firstValue + secondtValue;
                }
                );
              },
               child: Text('+', style: TextStyle(fontSize: 24))),

               ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red),
                elevation: WidgetStatePropertyAll(12), shadowColor: WidgetStatePropertyAll(Colors.black54)),onPressed: () {
                setState(() {
                  result = firstValue - secondtValue;
                }
                );
              },
               child: Text('-', style: TextStyle(fontSize: 27))),

               ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                elevation: WidgetStatePropertyAll(12), shadowColor: WidgetStatePropertyAll(Colors.black54)), onPressed: () {
                setState(() {
                  if (firstValue == 0.0) {result = 0;}
                  else if (secondtValue == 0.0) {result = 0;}
                  else {result = firstValue / secondtValue;}
                }
                );
              },
               child: Text('÷', style: TextStyle(fontSize: 27))),

              ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green),
               elevation: WidgetStatePropertyAll(12), shadowColor: WidgetStatePropertyAll(Colors.black54)),onPressed: () {
                setState(() {
                  result = firstValue * secondtValue;
                }
                );
              },
               child: Text('×', style: TextStyle(fontSize: 27))),

               ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey,
                 elevation: 12, shadowColor: Colors.black54),
                onPressed: resetCalc,
               child: Text('сброс', style: TextStyle(fontSize: 16)))
            ],
          ),
          SizedBox(height: 34),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration:  BoxDecoration(color: const Color.fromARGB(255, 49, 56, 163),
            borderRadius: BorderRadius.circular(16)),
            child: Text('Результат: $result', textAlign: TextAlign.center, 
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold)
            ),
            )
        ],
      ),
      )
    );
  }
}