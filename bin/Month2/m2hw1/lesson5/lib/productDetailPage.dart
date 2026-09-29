import 'package:flutter/material.dart';
import 'package:lesson5/orderPage.dart';

class ProductDetailPage extends StatelessWidget{
  final String title;
  final String desc;
  final String imageUrl;

  ProductDetailPage({
  required this.title,
  required this.desc,
  required this.imageUrl
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(padding: EdgeInsetsGeometry.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl, height: 200, fit: BoxFit.cover,),

          SizedBox(height: 16,),

          Text(desc),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (_) => OrderPage(productTitle: title)));
            }, child: Text('Куупить')),
          )
        ],
      ))
    );
  }}

