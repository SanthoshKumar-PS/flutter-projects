import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:iconsax/iconsax.dart';

class YourActivityBox extends StatelessWidget {
  YourActivityBox({required this.iconName,required this.heading,required this.date,required this.time,required this.timeStatus});
  final String heading;
  final String date;
  final String time;
  final String timeStatus;
  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: ListTile(
        leading: Container(
            decoration: BoxDecoration(
                color:Color(0xFFEAF3FF),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            padding: EdgeInsets.all(5),
            child: Icon(iconName,color: Colors.blue,)
        ),
        title: Text(heading,style: kEmailPhoneText.copyWith(fontSize: 15)),
        subtitle: Text(date,style: kVeryLightText.copyWith(fontSize: 14)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time,style: kEmailPhoneText.copyWith(fontSize: 15)),
            Text(timeStatus,style: kVeryLightText.copyWith(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
