import 'package:flutter/material.dart';

import '../constants.dart';

class AllCompletedPending extends StatelessWidget {
  final int statusIndex;
  final int currentSelectedIndex;
  final String statusString;
  final Function(int) onTap;
  const AllCompletedPending({super.key, required this.statusIndex, required this.currentSelectedIndex, required this.statusString, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: ()=> onTap(statusIndex),
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              color: statusIndex==currentSelectedIndex?kPurpleColor.withOpacity(0.3):Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Center(
              child: Text(
                  statusString,
                  style: TextStyle(
                      fontFamily: 'Serif',fontWeight: FontWeight.bold,fontSize:17,color: statusIndex==currentSelectedIndex?kPurpleColor:Colors.black
                  )
              )
          ),
        ),
      ),
    );
  }
}
