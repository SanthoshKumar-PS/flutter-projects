import 'package:flutter/material.dart';
import 'package:todo/constants.dart';

class LoadingTabbar extends StatelessWidget {
  final IconData iconName;
  const LoadingTabbar({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: kBackgroundColor,
          border: Border.all(
              width: 1,
              color: Colors.black.withOpacity(0.03)
          ),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              radius: 18,
              backgroundColor: Colors.black.withOpacity(0.03),
              child: Icon(iconName,size: 23,color: Colors.black.withOpacity(0.20))
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(height: 20,width: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.black.withOpacity(0.03)),),
            ],
          )
        ],
      ),
    );
  }
}
