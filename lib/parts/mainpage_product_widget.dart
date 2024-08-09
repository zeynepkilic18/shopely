import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
    required this.title,
    required this.pitcureadress,
    required this.usdFiyat,
    required this.percentageoff,
    required this.rating,
    required this.stock,
    required this.oldprice,
  }) : super(key: key);

  final String title;
  final String pitcureadress;
  final double usdFiyat;
  final double percentageoff;
  final double rating;
  final double stock;
  final double oldprice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            pitcureadress,
            fit: BoxFit.cover,
            height: 150,
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$$usdFiyat',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.red,
            ),
          ),
          Text(
            'Old price: \$$oldprice',
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              fontSize: 10,
            ),
          ),
          Text(
            '$percentageoff% OFF',
            style: const TextStyle(
              color: Colors.orange,
            ),
          ),
          Text(
            'Rating: $rating ',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          Text(
            'Stock: $stock',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
