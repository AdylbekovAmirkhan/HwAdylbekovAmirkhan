import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Название статьи')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Заголовок',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              Text('Очень длинный текст...\n' * 35),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {},
                child: Text('Вернуться на главную'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}