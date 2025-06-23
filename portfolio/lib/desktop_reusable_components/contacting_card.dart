import 'package:flutter/material.dart';

import '../constants.dart';

class ContactingCard extends StatelessWidget {
  final String contactMethod;
  final String contactString;
  final IconData iconName;
  final GestureTapCallback urlMethod;
  const ContactingCard({super.key, required this.contactMethod, required this.contactString, required this.iconName, required this.urlMethod});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: urlMethod,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF0D47A1), Color(0xFF64B5F6)], // dark blue to light blue
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                ),
                shape: BoxShape.circle
            ),
            child: Icon(iconName,color: Colors.white,size: 25,),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contactMethod,style: tBodyTextStyle.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
              Text(contactString,style: tBodyTextStyle.copyWith(fontWeight: FontWeight.w500, color: Colors.black,fontSize: 15),)
            ],
          )
        ],
      ),
    );
  }
}
