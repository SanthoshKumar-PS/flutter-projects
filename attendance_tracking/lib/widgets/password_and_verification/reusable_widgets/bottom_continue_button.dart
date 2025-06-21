import 'package:flutter/material.dart';
import 'package:attendance_tracking/constants.dart';

class BottomContinueButton extends StatelessWidget {
  BottomContinueButton({required this.text});
  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      decoration: BoxDecoration(
          color: kBluePasswordVerification,
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Center(
        child: Text(text,style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'PoppinsLight',
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}