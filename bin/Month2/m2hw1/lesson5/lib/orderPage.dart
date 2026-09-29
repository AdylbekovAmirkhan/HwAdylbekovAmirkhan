import 'package:flutter/material.dart';
import 'package:lesson5/productAccess.dart';

class OrderPage extends StatelessWidget{
  final String productTitle;

  OrderPage({
    required this.productTitle
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Заказ и оплата'),
    ),
    body: Padding(padding: EdgeInsetsGeometry.all(16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Ваш заказ', style: TextStyle(fontSize: 16),),
      SizedBox(height: 8,),
      Text(productTitle),
      SizedBox(height: 24,),
      Text('Способ оплаты', style: TextStyle(fontSize: 26),),
      SizedBox(height: 15,),

      ListTile(leading: Icon(Icons.credit_card), title: Text('Банковская карта') ,),
      ListTile(leading: Icon(Icons.wallet), title: Text('Электронный кошелек') ,),

      SizedBox(width: double.infinity, child: ElevatedButton(onPressed:() {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Productaccess(title: productTitle)));
      }, child: Text('оплатить')),)

    ],),),
    );
  }
}