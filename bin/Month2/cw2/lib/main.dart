import 'package:flutter/material.dart';
import 'catalogPage.dart';

void main() {
  runApp(const CatalogApp());
}

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Каталог приложений',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const CatalogPage(),
    );
  }
}
