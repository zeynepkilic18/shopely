import 'package:flutter/material.dart';

class OffPage extends StatefulWidget {
  const OffPage({
    super.key,
    required this.pitcureadress,
    required this.title,
    required this.title2,
  });

  final String pitcureadress;
  final String title;
  final String title2;

  @override
  State<OffPage> createState() => _OffPageState();
}

class _OffPageState extends State<OffPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 210,
        width: 170,
        color: Colors.white,
        child: Card(
          elevation: 0, // Elevation of the card
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8.0), // Border radius of the card
          ),
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    widget.pitcureadress,
                  ),
                ],
              ),
              Text(widget.title),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(
                    left: 40,
                  )),
                  Container(
                    width: 100,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.red, // Set the background color
                      borderRadius:
                          BorderRadius.circular(2), // Set the border radius
                    ),
                    child: Center(
                      child: Text(
                        widget.title2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
