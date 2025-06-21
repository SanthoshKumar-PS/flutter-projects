import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
import 'package:iconsax/iconsax.dart';

class TotalAttendanceBoxes extends StatelessWidget {
  TotalAttendanceBoxes({required this.iconName,required this.heading,required this.time,required this.timeStatus});
  final String heading;
  final String time;
  final String timeStatus;
  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color:Color(0xFFEAF3FF),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        padding: EdgeInsets.all(5),
                        child: Icon(iconName,color: Colors.blue,)
                    ),
                    SizedBox(width: 10),
                    Text(heading,style: kLeaveDetailsHeader.copyWith(fontSize: 14),)
                  ],
                ),
                SizedBox(height: 5),
                Text(time,style: kLeaveDetailsFooter.copyWith(fontSize: 18)),
                SizedBox(height: 5),
                Text(timeStatus,style: kLeaveDetailsHeader.copyWith(fontSize: 14))


              ],
            ),
          ],
        ),
      ),
    );
  }
}
