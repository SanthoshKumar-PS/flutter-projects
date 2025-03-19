import 'package:flutter/material.dart';

class GestureContainer extends StatelessWidget {
  final Color coloring;
  final VoidCallback? onPressed;
  final Widget? cardWidget;

  GestureContainer({
    required this.onPressed,
    this.cardWidget = const SizedBox(),
    this.coloring = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: coloring,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: cardWidget,
      ),
    );
  }
}