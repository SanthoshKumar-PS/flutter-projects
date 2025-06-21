import 'package:flutter/material.dart';
class BottomButtonApplyReset extends StatelessWidget {
  BottomButtonApplyReset({required this.text,required this.bgcolor,required this.textcolor});
  final String text;
  final Color bgcolor;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 57,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: bgcolor,
        ),
        child: Center(
          child: Text(text,style: TextStyle(
              color: textcolor,
              fontSize: 15,
              fontFamily: 'PoppinsLight',
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none
          )),
        ),
      ),
    );
  }
}