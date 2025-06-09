import 'package:flutter/material.dart';
import 'main.dart';
class RawButtonPlusMinus extends StatelessWidget {
  RawButtonPlusMinus(this.iconName,this.onPressed);

  final IconData? iconName;
  final VoidCallback? onPressed;



  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: kDarkColor,
      elevation: 10,
      shape: CircleBorder(),
      constraints: BoxConstraints(minWidth: 50,minHeight: 50),
      onPressed:onPressed,
      child: Icon(
          iconName,
          size: 25,
          color: Colors.white),
    );
  }
}