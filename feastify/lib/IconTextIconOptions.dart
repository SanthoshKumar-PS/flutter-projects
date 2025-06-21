import 'package:flutter/material.dart';
import 'main.dart';
class IconTextIcon extends StatelessWidget {
  IconTextIcon({this.iconName1,required this.textString, this.iconName2,this.textColor=Colors.white,this.iconColor=Colors.white});
  final IconData? iconName1;
  final IconData? iconName2;
  final String textString;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 30,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white70.withOpacity(0.7),
                blurRadius: 2,
                spreadRadius: 1,
                blurStyle: BlurStyle.inner

            ),],
          color:kforegroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (iconName1 != null)
            Icon(iconName1, color: iconColor),
          Text(
            textString,
            style: TextStyle(
              fontFamily: 'KumarOne',
                color: iconColor, fontSize: 15, decoration: TextDecoration.none),
          ),
          if (iconName2 != null)
            Icon(iconName2, color: iconColor),
        ],
      ),
    );
  }
}