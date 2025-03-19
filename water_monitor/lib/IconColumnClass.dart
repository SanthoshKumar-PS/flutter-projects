import 'package:flutter/material.dart';
import 'main.dart';

class IconColumn extends StatelessWidget {
  final IconData icon;
  final String textValue;

  IconColumn(this.icon, this.textValue);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 125, color: Colors.white),
        Text(textValue, style: kTextStyle),
      ],
    );
  }
}