import 'package:flutter/material.dart';
//This class if for what's on your mind column

class WhatsOnYourMind extends StatelessWidget {
  WhatsOnYourMind({required this.requiredText});
  final String requiredText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(requiredText,
            style: TextStyle(
                decoration:TextDecoration.none,fontSize: 18, fontWeight: FontWeight.w800,color: Colors.white,
              fontFamily: 'Tridion'
            ),),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

