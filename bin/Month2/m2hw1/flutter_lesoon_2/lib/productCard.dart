import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String category;
  final int rating;
  final bool sale;
  
ProductCard({
    required this.image,
    required this.title,
    required this.price,
    required this.category,
    required this.rating,
    this.sale = false,
  });
  
@override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // -------- STACK: картинка + SALE badge -------------
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 120,
                    color: Colors.red,
                    child: Center(child: Text('Ошибка')),
                  ),
                ),
              ),
              // Плашка SALE
              if (sale)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "SALE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),
          // -------- Название + цена (Flexible + Spacer) -------
          Row(
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),
              Spacer(),
              Text(
                price,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),
                child: Text(category)
                ),
                Row(
            mainAxisAlignment: MainAxisAlignment.start, // Звезды будут слева
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                size: 16,
                color: index < rating ? Colors.amber : Colors.grey,
              );
            }),
          ),
            ],
          ),
          SizedBox(height: 8),
          Align(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Купить'),
              ),
            ),
          ),
          OutlinedButton(
  onPressed: () { 
    // Пока пусто
  },
  child: Text("В избранное"),
)

        ],
      ),
    );
  }
}
