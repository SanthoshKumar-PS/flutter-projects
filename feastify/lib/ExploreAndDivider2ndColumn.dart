import 'package:flutter/material.dart';
// This is 2nd Column including divider and Expand
class ExploreAndDivider2ndColumn extends StatelessWidget {
  const ExploreAndDivider2ndColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white, // Color of the dashes
            thickness: 1, // Thickness of the line
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "EXPLORE",
            style: TextStyle(decoration:TextDecoration.none,fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'NotoSerif'),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

