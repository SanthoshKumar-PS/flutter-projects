import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
class LeaveContainter extends StatelessWidget {
  LeaveContainter({
    required this.text,
    required this.borderColor,
    required this.count,
    required this.bgColor,
  });
  final String text;
  final Color borderColor;
  final int count;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 1.5),
          color: bgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(text, style: kTextStyle),
              Text(
                count.toString(),
                style: kTextStyle.copyWith(color: borderColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
