import 'package:flutter/material.dart';

import '../constants.dart';

class ContactCard extends StatefulWidget {
  final IconData iconName;
  final String contact;
  final GestureTapCallback performMethod;
  const ContactCard({super.key, required this.iconName, required this.contact, required this.performMethod});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool isHovering=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.performMethod,
      child: MouseRegion(
        onEnter: (_){
          setState(() {
            isHovering=true;
          });
        },
        onExit: (_){
          setState(() {
            isHovering=false;
          });
        },
        child: Container(
          margin: EdgeInsets.all(8),
          height: 50,
          decoration: BoxDecoration(
              color: isHovering?Colors.white.withOpacity(0.6) : Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.iconName,size: 20,color:Colors.white,),
                SizedBox(width: 10),
                Text(widget.contact,style: tSubheadingTextStyle.copyWith(fontSize: 14),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
