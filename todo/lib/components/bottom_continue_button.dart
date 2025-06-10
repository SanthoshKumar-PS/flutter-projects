import 'package:flutter/material.dart';
import 'package:todo/constants.dart';

class BottomContinueButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  const BottomContinueButton({super.key, required this.text, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      decoration: BoxDecoration(
          color: buttonColor,
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
