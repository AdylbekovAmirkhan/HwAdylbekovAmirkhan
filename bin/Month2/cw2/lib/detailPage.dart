import 'package:flutter/material.dart';
import 'catalogItem.dart';

class DetailPage extends StatefulWidget {
  final CatalogItem item;

  const DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.item.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.item.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFavorite ? Colors.green.shade600 : Colors.blue.shade500,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
                label: Text(
                  isFavorite ? 'Добавлено в избранное' : 'Добавить в избранное',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const Text(
                'Назад',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
