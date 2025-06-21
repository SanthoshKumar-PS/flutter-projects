import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Theme profileListTile({
  required String text,
  required Icon icon,
  required VoidCallback onTap,
}) {
  return Theme(
    data: ThemeData(
        splashColor: Colors.transparent, highlightColor: Colors.transparent),
    child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFF7F7F8),
          ),
          child: icon,
        ),
        title: Text(
          text,
          style:
              TextStyle(fontWeight: FontWeight.w900,color: Colors.black, fontFamily: 'AfacadFlux',fontSize: 15),
        ),
        trailing: Icon(Icons.navigate_next),
        onTap: onTap),
  );
}
