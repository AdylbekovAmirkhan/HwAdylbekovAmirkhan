import 'package:flutter/material.dart';
import 'catalogItem.dart';
import 'detailPage.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CatalogItem> items = List.generate(
      10,
      (index) => CatalogItem(
        title: 'Item ${index + 1}',
        description: 'Описание элемента ${index + 1}',
        icon: Icons.article_outlined,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 0,
            color: Colors.grey.shade50,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: ListTile(
              leading: Icon(item.icon, color: Colors.black87),
              title: Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item.description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
