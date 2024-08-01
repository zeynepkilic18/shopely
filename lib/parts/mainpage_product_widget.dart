import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.title,
    required this.pitcureadress,
    required this.usdFiyat,
    required this.percentageoff,
    required this.rating,
    required this.stock,
    required this.oldprice,
  });

  final String title;
  final String pitcureadress;
  final double usdFiyat;
  final double percentageoff;
  final double rating;
  final double stock;
  final double oldprice;

  @override
  State createState() => _MainPageProductWidgetState();

  /* 
  Üstteki fonksiyonun uzun versiyonu
  State createState() {
  return _MainPageProductWidgetState();
  } 
  */
}

class _MainPageProductWidgetState extends State<MainPage> {
  bool isfavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 180,
      child: Card(
        elevation: 0, // Elevation of the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Border radius of the card
        ),
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.pitcureadress,
                  height: 180,
                ),
                Positioned.fill(
                    bottom: 70,
                    left: 116,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isfavorite = !isfavorite;
                          });
                        },
                        child: Icon(
                          Icons.favorite,
                          color: isfavorite
                              ? Colors.red
                              : const Color.fromARGB(20, 0, 0, 0),
                          // You can customize the color
                          size: 20.0, // You can customize the size
                        ),
                      ),
                    )),
              ],
            ),
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "\$${widget.usdFiyat} ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "\$${widget.oldprice} ",
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 10,
                  ),
                ),
                Text(
                  "${widget.percentageoff}% OFF",
                  style: const TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset("assets/Rating-Icon.png"),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  "${widget.rating} ",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  "(${widget.stock})",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
