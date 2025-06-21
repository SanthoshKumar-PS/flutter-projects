import 'package:flutter/material.dart';

class TeamLeaveAcceptReject extends StatelessWidget {
  TeamLeaveAcceptReject({
    required this.text,
    required this.iconName,
    required this.color,
  });
  final String text;
  final IconData iconName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: color,
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