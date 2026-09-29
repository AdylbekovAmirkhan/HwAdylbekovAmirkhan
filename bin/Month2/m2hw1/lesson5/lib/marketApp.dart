import 'package:flutter/material.dart';
import 'package:lesson5/ProductListPage.dart';

class MarketApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListPage(),
    );

}
}