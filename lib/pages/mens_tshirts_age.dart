import 'package:flutter/material.dart';
import 'package:flutter_application_1/parts/mainpage_product_widget.dart';

class MensTshirtsPage extends StatelessWidget {
  const MensTshirtsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tshirts = [
      {
        'title': 'Allen Solly Regular fit cotton shirt',
        'pitcureadress': "assets/Allen-Solly.png",
        'usdFiyat': 75,
        'percentageoff': 20,
        'rating': 4.4,
        'stock': 412,
        'oldprice': 90,
      },
      {
        'title': 'Calvin Clein Regular fit slim fit shirt',
        'pitcureadress': 'assets/Calvin-Clein.png',
        'usdFiyat': 75,
        'percentageoff': 20,
        'rating': 4.2,
        'stock': 214,
        'oldprice': 90,
      },
      {
        'title': 'H&M Half Regular fit cotton shirt',
        'pitcureadress': 'assets/H&P.png',
        'usdFiyat': 55,
        'percentageoff': 15,
        'rating': 4.5,
        'stock': 332,
        'oldprice': 65,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mens T-Shirts'),
        backgroundColor: const Color.fromARGB(255, 231, 178, 196),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: tshirts.length,
            itemBuilder: (context, index) {
              final tshirt = tshirts[index];
              return MainPage(
                title: tshirt['title'],
                pitcureadress: tshirt['pitcureadress'],
                usdFiyat: tshirt['usdFiyat'],
                percentageoff: tshirt['percentageoff'],
                rating: tshirt['rating'],
                stock: tshirt['stock'],
                oldprice: tshirt['oldprice'],
              );
            },
          ),
        ),
      ),
    );
  }
}
