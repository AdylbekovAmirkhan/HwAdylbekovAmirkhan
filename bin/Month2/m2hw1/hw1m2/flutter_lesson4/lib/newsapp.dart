import 'package:flutter/material.dart';

class NewsApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[50],
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 14))
      ),
      debugShowCheckedModeBanner: false,
      home: NewsHome(),
    );
  }
}

class NewsHome extends StatelessWidget{
  final List<Map<String, String>> news = List.generate(20, (i) => {
    'title': 'Заголовок новости ${i + 1}',
    'subtitle': 'описание новости ${i + 1}',
    'image': 'https://picsum.photos/seed/news$i/400/200'
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Лента новостей')),
      body: ListView.builder(itemBuilder: (context, index){final item = news[index];
      return Card(margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 1, child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Image.network(item['image']!, height: 160, width: double.infinity, fit: BoxFit.cover,),
        Padding(padding: EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(item['title']!, style: Theme.of(context).textTheme.titleLarge,),
          SizedBox(height: 8,),
          Text('')
        ],),)],
      ),
      );
      }, padding: EdgeInsets.all(16), itemCount: news.length,),
    );
  }

}
