import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        height: 0.11,
        letterSpacing: 0.07,
      ),
    );
  }
}
