import 'package:flutter/material.dart';

class accept_reject extends StatelessWidget {
  accept_reject({required this.text,required this.iconName,required this.coloring});
  final String text;
  final IconData iconName;
  final Color coloring;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: coloring,
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
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
