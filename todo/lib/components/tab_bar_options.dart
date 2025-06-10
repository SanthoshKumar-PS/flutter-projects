import 'package:flutter/material.dart';

import '../constants.dart';

class TabBarOptions extends StatelessWidget {
  final IconData iconName;
  final String tabText;
  final String tabCount;
  final Color tabColor;
  const TabBarOptions({super.key, required this.iconName, required this.tabText, required this.tabCount, required this.tabColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(
            width: 1,
            color: tabColor
          ),
        boxShadow: [
          BoxShadow(
          color: tabColor.withOpacity(0.15),
          blurRadius: 2,
          spreadRadius: 0,
          offset: Offset(0, 0),
        ),
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              radius: 18,
              backgroundColor: kBackgroundColor,
              child: Icon(iconName,size: 23,color: tabColor)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tabText,style: TextStyle(fontFamily: 'Serif',fontWeight: FontWeight.bold,fontSize: 18)),
              Text(tabCount,style: TextStyle(fontFamily: 'Serif',fontWeight: FontWeight.bold,fontSize: 23))
            ],
          )
        ],
      ),
    );
  }
}
