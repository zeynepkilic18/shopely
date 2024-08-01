import 'package:flutter/material.dart';

class MainSegment extends StatefulWidget {
  const MainSegment({
    Key? key, // Added 'Key?' as the type for key
    required this.title,
    required this.pictureAddress, // Changed 'pitcureadress' to 'pictureAddress'
  }) : super(key: key);

  final String title;
  final String pictureAddress;

  @override
  State<MainSegment> createState() => _MainSegmentState();
}

class _MainSegmentState extends State<MainSegment> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      // ignore: sort_child_properties_last
      child: Column(
        children: [
          Image.asset(
            widget.pictureAddress,
            height: 80,
          ),
          Text(widget.title),
        ],
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 26, 26, 26),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Text color
        elevation: 0, // Elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // BorderRadius
        ),
      ),
    );
  }
}
