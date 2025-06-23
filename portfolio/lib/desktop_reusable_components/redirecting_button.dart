import 'package:flutter/material.dart';

import '../constants.dart';

class RedirectingButton extends StatefulWidget {
  final String buttonString;
  RedirectingButton({super.key, required this.buttonString});

  @override
  State<RedirectingButton> createState() => _RedirectingButtonState();
}

class _RedirectingButtonState extends State<RedirectingButton> {
  bool onHovering=false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter:(_){
        setState(() {
          onHovering=true;
        });
      },
      onExit: (_){
        setState(() {
          onHovering=false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: const LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF64B5F6)], // dark blue to light blue
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: onHovering?Colors.white.withOpacity(0.1):Colors.transparent,
              offset: Offset(0,0),
              blurRadius: 10,
              spreadRadius: 3

            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
          child: Text(widget.buttonString,style: tSubheadingTextStyle,),
        ),

      ),
    );
  }
}
