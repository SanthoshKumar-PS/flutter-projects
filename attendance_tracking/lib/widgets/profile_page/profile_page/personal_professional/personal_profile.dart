import 'package:flutter/material.dart';

class PersonalInformationDetails extends StatelessWidget {
  const PersonalInformationDetails(
      {required this.text, required this.subtext, super.key});

  final String text;
  final String subtext;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            text,
            style: TextStyle(
                color: Color(0xFFB7B9BE), fontSize: 13, fontFamily: 'AfacadFlux'),
          ),
          subtitle: Text(
            subtext,
            style: TextStyle(
                color: Color(0xFF101317),
                fontSize: 17,
                fontFamily: 'AfacadFlux',
                fontWeight: FontWeight.w600),
          ),
        ),
        Divider(
          thickness: 1,
          color: Color(0XFFF6F7F7),
          height: 0,
        ),
      ],
    );
  }
}
