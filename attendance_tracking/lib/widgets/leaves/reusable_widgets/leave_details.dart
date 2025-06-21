import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';
class LeaveDetails extends StatelessWidget {
  LeaveDetails({required this.description,required this.value});
  final String description;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(description,style: kLeaveDetailsHeader,),
        ),
        Text(value,style: kLeaveDetailsFooter)
      ],
    );
  }
}