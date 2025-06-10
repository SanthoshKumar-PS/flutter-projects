import 'package:flutter/material.dart';

import '../constants.dart';

class LoginRegisterButton extends StatelessWidget {
  final String inpText;
  const LoginRegisterButton({super.key, required this.inpText});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: kPurpleColor.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Center(
          child: Text(
              inpText,
              style: TextStyle(fontSize: 20,fontFamily: 'Serif',fontWeight: FontWeight.bold,color: kPurpleColor)
          )
      ),
    );
  }
}
