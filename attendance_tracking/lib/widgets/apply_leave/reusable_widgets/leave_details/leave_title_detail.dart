import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';

class LeaveTitleDetail extends StatelessWidget {
  LeaveTitleDetail({required this.title,required this.reason});
  final String title;
  final String reason;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: kVeryLightText,),
        SizedBox(height: 3),
        Text(reason,style: kEmailPhoneText.copyWith(fontWeight: FontWeight.w500,fontSize: 16)),
        SizedBox(height: 3),
        Divider(
            color: Color(0xFFE7E7E8),
            thickness: 2
        ),
        SizedBox(height: 3),
      ],
    );
  }
}
