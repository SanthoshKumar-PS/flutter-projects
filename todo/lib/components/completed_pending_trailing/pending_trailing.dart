import 'package:flutter/material.dart';

class PendingTrailing extends StatelessWidget {
  const PendingTrailing({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFFF3FCFB),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical:7), //Color(0xFF53D9D2) lite green
      child: Text('Pending',style: TextStyle(color: Color(0xFFD2484F),fontFamily: 'Poppins',fontSize: 11),),
    );
  }
}
