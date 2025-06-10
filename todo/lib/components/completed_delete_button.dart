import 'package:flutter/material.dart';

class CompletedDeleteButton extends StatelessWidget {
  final Color containerColor;
  final IconData iconName;
  final String text;
  const CompletedDeleteButton({super.key, required this.containerColor, required this.iconName, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: containerColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconName, color: Colors.white, size: 23),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Outfit',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
