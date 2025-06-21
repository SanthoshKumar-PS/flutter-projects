import 'package:flutter/material.dart';

class DoubleTextScroll extends StatelessWidget {
  DoubleTextScroll({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 40,
      child: Text(name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              decoration:TextDecoration.none,
              fontSize: 15, fontWeight: FontWeight.bold,
              color:Colors.white70)),
    );
  }
}